package runner;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.IOException;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class TablaDecisionClimatizacionTest {
    private static final String EVALUAR = "/api/decision/climatizacion/evaluar";
    private static final String REINICIAR = "/api/decision/climatizacion/reiniciar";

    @BeforeEach
    void limpiarHistorial() throws IOException, InterruptedException {
        ApiTestClient.post(REINICIAR, "");
    }

    @ParameterizedTest(name = "C1={0}, C2={1}, C3={2}")
    @MethodSource("todasLasCombinaciones")
    void debeEvaluarCadaCombinacionDeLaTabla(boolean c1, boolean c2, boolean c3,
                                             String action, int ruleIndex)
            throws IOException, InterruptedException {
        String values = "[" + c1 + "," + c2 + "," + c3 + "]";
        String response = ApiTestClient.post(
                EVALUAR, "{\"valores\":" + values + "}");

        assertTrue(response.contains("\"valores\":[" + c1 + "," + c2 + "," + c3 + "]"));
        assertEquals(action, jsonString(response, "accion"));
        assertEquals(ruleIndex, jsonNumber(response, "reglaIndex"));
        assertEquals("false", jsonValue(response, "noDefinida"));
    }

    static Stream<Arguments> todasLasCombinaciones() {
        return Stream.of(
                Arguments.of(false, false, false, "Mantener sistema apagado", 3),
                Arguments.of(false, false, true,
                        "Apagar sistema de climatización y emitir alerta sonora", 0),
                Arguments.of(false, true, false, "Mantener sistema apagado", 3),
                Arguments.of(false, true, true,
                        "Apagar sistema de climatización y emitir alerta sonora", 0),
                Arguments.of(true, false, false,
                        "Mantener en modo de bajo consumo energético", 2),
                Arguments.of(true, false, true,
                        "Apagar sistema de climatización y emitir alerta sonora", 0),
                Arguments.of(true, true, false,
                        "Encender aire acondicionado en modo refrigeración", 1),
                Arguments.of(true, true, true,
                        "Apagar sistema de climatización y emitir alerta sonora", 0)
        );
    }

    private static String jsonString(String json, String field) {
        String value = jsonValue(json, field);
        return value.substring(1, value.length() - 1);
    }

    private static int jsonNumber(String json, String field) {
        return Integer.parseInt(jsonValue(json, field));
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

    private record DecisionCase(String values, String action, int ruleIndex) {
    }
}
