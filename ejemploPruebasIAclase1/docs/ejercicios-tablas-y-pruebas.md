# Ejercicios de tablas de decisión y transición de estados

La fuente del ejercicio es la API de caja negra descrita en
`Github/workflow/peticiones_de_pruebas_de_caja_negra.md`.

## 1. Tabla de decisión: climatización

Condiciones:

| C1: temperatura interior > 26 °C | C2: presencia humana | C3: puertas/ventanas abiertas > 3 min |
|---|---|---|
| V/F | V/F | V/F |

| Regla | C1 | C2 | C3 | Resultado |
|---|---:|---:|---:|---|
| R1 | F | F | V | Apagar sistema de climatización y emitir alerta sonora |
| R2 | V | V | F | Encender aire acondicionado en modo refrigeración |
| R3 | V | F | F | Mantener en modo de bajo consumo energético |
| R4 | F | F | F | Mantener sistema apagado |

La matriz completa de 2^3 = 8 combinaciones queda cubierta así:

| C1 | C2 | C3 | Regla | Resultado |
|---:|---:|---:|---:|---|
| F | F | F | R4 | Mantener sistema apagado |
| F | F | V | R1 | Apagar sistema de climatización y emitir alerta sonora |
| F | V | F | R4 | Mantener sistema apagado |
| F | V | V | R1 | Apagar sistema de climatización y emitir alerta sonora |
| V | F | F | R3 | Mantener en modo de bajo consumo energético |
| V | F | V | R1 | Apagar sistema de climatización y emitir alerta sonora |
| V | V | F | R2 | Encender aire acondicionado en modo refrigeración |
| V | V | V | R1 | Apagar sistema de climatización y emitir alerta sonora |

## 2. Tabla de transición: Barista Bot

Estado inicial: `En Espera`.

| Estado actual | Evento | Estado siguiente | Válida |
|---|---|---|---|
La máquina tiene 5 estados y 6 eventos, por lo que la matriz exhaustiva contiene
30 casos. Las transiciones válidas son:

| Estado actual | Evento | Estado siguiente |
|---|---|---|
| En Espera | Iniciar Pedido | Moliendo |
| Moliendo | Terminar Molienda | Calentando Agua |
| Moliendo | Sin Ingredientes | Error de Insumos |
| Calentando Agua | Alcanzar Temperatura | Sirviendo |
| Calentando Agua | Sin Ingredientes | Error de Insumos |
| Sirviendo | Terminar Llenado | En Espera |
| Sirviendo | Sin Ingredientes | Error de Insumos |
| Error de Insumos | Recargar y Reiniciar | En Espera |

Los otros 22 casos son transiciones inválidas: la máquina conserva el estado
actual y devuelve `valida: false`. La especificación Gherkin enumera las 30
filas individualmente.

## 3. Casos Gherkin definidos

Las especificaciones Gherkin completas están en
`src/test/resources/features/climatizacion.feature` y
`src/test/resources/features/barista.feature`. La implementación JUnit que
ejecuta estos casos contra la API está en:

- `src/test/java/runner/TablaDecisionClimatizacionTest.java`
- `src/test/java/runner/TablaTransicionBaristaTest.java`

La prueba de decisión ejecuta 8 casos parametrizados. La prueba de estados
ejecuta 30 casos parametrizados, prepara el estado requerido desde el estado
inicial y verifica estado anterior, evento, estado nuevo, validez y rechazo de
transiciones no definidas.
