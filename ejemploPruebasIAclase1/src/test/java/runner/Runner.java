package runner;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Runner {
    @Test

    void testParallel() {

        Results results = Runner.path("classpath:features")

                .outputCucumberJson(true) // <--- AQU� SE CONFIGURA

                .parallel(1);             // Define el n�mero de hilos concurrentes

        // Aserci�n para asegurar que el build de Gradle/Maven falle si alguna prueba no pasa

        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }

}