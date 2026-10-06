package runner;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.IOException;
import java.util.Map;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TablaTransicionBaristaTest {
    private static final String EVENTO = "/api/barista-bot/evento";
    private static final String REINICIAR = "/api/barista-bot/reiniciar";

    @BeforeEach
    void reiniciarMaquina() throws IOException, InterruptedException {
        ApiTestClient.post(REINICIAR, "");
        esperarEstado("En Espera");
    }

    @ParameterizedTest(name = "{0} + {1} -> {2} (valida={3})")
    @MethodSource("todasLasTransiciones")
    void debeEvaluarCadaCombinacionEstadoEvento(String from, String event, String to,
                                                boolean valid)
            throws IOException, InterruptedException {
        reiniciarMaquina();
        prepararEstado(from);
        String response = ApiTestClient.post(
                EVENTO, "{\"evento\":\"" + event + "\"}");

        assertEquals(from, jsonString(response, "estadoAnterior"));
        assertEquals(event, jsonString(response, "evento"));
        assertEquals(to, jsonString(response, "estadoNuevo"));
        assertEquals(Boolean.toString(valid), jsonValue(response, "valida"));
        assertEquals(!valid, response.contains("\"noDefinida\":true"));
    }

    static Stream<Arguments> todasLasTransiciones() {
        String[] states = {"En Espera", "Moliendo", "Calentando Agua",
                "Sirviendo", "Error de Insumos"};
        String[] events = {"Iniciar Pedido", "Terminar Molienda",
                "Alcanzar Temperatura", "Terminar Llenado",
                "Sin Ingredientes", "Recargar y Reiniciar"};
        Map<String, String> validTransitions = Map.of(
                "En Espera|Iniciar Pedido", "Moliendo",
                "Moliendo|Terminar Molienda", "Calentando Agua",
                "Moliendo|Sin Ingredientes", "Error de Insumos",
                "Calentando Agua|Alcanzar Temperatura", "Sirviendo",
                "Calentando Agua|Sin Ingredientes", "Error de Insumos",
                "Sirviendo|Terminar Llenado", "En Espera",
                "Sirviendo|Sin Ingredientes", "Error de Insumos",
                "Error de Insumos|Recargar y Reiniciar", "En Espera"
        );

        return Stream.of(states)
                .flatMap(state -> Stream.of(events)
                        .map(event -> {
                            String key = state + "|" + event;
                            return Arguments.of(state, event,
                                    validTransitions.getOrDefault(key, state),
                                    validTransitions.containsKey(key));
                        }));
    }

    private static void prepararEstado(String state)
            throws IOException, InterruptedException {
        String[] path = switch (state) {
            case "En Espera" -> new String[]{};
            case "Moliendo" -> new String[]{"Iniciar Pedido"};
            case "Calentando Agua" -> new String[]{"Iniciar Pedido", "Terminar Molienda"};
            case "Sirviendo" -> new String[]{"Iniciar Pedido", "Terminar Molienda",
                    "Alcanzar Temperatura"};
            case "Error de Insumos" -> new String[]{"Iniciar Pedido", "Sin Ingredientes"};
            default -> throw new IllegalArgumentException("Estado no soportado: " + state);
        };
        for (String event : path) {
            ApiTestClient.post(EVENTO, "{\"evento\":\"" + event + "\"}");
        }
        esperarEstado(state);
    }

    private static void esperarEstado(String expected)
            throws IOException, InterruptedException {
        AssertionError lastError = null;
        for (int attempt = 0; attempt < 10; attempt++) {
            String response = ApiTestClient.get("/api/barista-bot/estado");
            String actual = jsonString(response, "estadoActual");
            if (expected.equals(actual)) {
                return;
            }
            lastError = new AssertionError(
                    "Se esperaba estado " + expected + " pero la API reporto " + actual);
            Thread.sleep(250);
        }
        throw lastError;
    }

    private static String jsonString(String json, String field) {
        String value = jsonValue(json, field);
        return value.substring(1, value.length() - 1);
    }

    private static String jsonValue(String json, String field) {
        String marker = "\"" + field + "\":";
        int start = json.indexOf(marker);
        if (start < 0) {
            throw new AssertionError("No se encontro el campo " + field + " en " + json);
        }
        start += marker.length();
        int end = json.indexOf(',', start);
        if (end < 0) {
            end = json.indexOf('}', start);
        }
        return json.substring(start, end).trim();
    }

}
