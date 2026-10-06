Feature: Controlador de climatizacion basado en tabla de decision

  Background:
    * def reglas =
      """
      [
        {
          "temperatura": false,
          "presencia": false,
          "apertura": true,
          "accion": "Apagar sistema de climatización y emitir alerta sonora",
          "regla": 0
        },
        {
          "temperatura": false,
          "presencia": true,
          "apertura": false,
          "accion": "Mantener sistema apagado",
          "regla": 3
        },
        {
          "temperatura": false,
          "presencia": true,
          "apertura": true,
          "accion": "Apagar sistema de climatización y emitir alerta sonora",
          "regla": 0
        },
        {
          "temperatura": true,
          "presencia": true,
          "apertura": false,
          "accion": "Encender aire acondicionado en modo refrigeración",
          "regla": 1
        },
        {
          "temperatura": true,
          "presencia": false,
          "apertura": false,
          "accion": "Mantener en modo de bajo consumo energético",
          "regla": 2
        },
        {
          "temperatura": true,
          "presencia": false,
          "apertura": true,
          "accion": "Apagar sistema de climatización y emitir alerta sonora",
          "regla": 0
        },
        {
          "temperatura": true,
          "presencia": true,
          "apertura": true,
          "accion": "Apagar sistema de climatización y emitir alerta sonora",
          "regla": 0
        },
        {
          "temperatura": false,
          "presencia": false,
          "apertura": false,
          "accion": "Mantener sistema apagado",
          "regla": 3
        }
      ]
      """

  Scenario Outline: Evaluar cada combinacion de condiciones

    * def temperatura = '<temperatura>' == 'true'
    * def presencia = '<presencia>' == 'true'
    * def apertura = '<apertura>' == 'true'
    * def accionEsperada = '<accion>'
    * def reglaEsperada = <regla>

    * def reglaEncontrada = karate.jsonPath(reglas, "$[?(@.temperatura == " + temperatura + " && @.presencia == " + presencia + " && @.apertura == " + apertura + ")]")[0]

    Then match reglaEncontrada.accion == accionEsperada
    And match reglaEncontrada.regla == reglaEsperada
    And match reglaEncontrada == '#present'

    Examples:
      | temperatura | presencia | apertura | accion                                                   | regla |
      | false       | false     | true     | Apagar sistema de climatización y emitir alerta sonora  | 0     |
      | false       | true      | false    | Mantener sistema apagado                                | 3     |
      | false       | true      | true     | Apagar sistema de climatización y emitir alerta sonora  | 0     |
      | true        | true      | false    | Encender aire acondicionado en modo refrigeración       | 1     |
      | true        | false     | false    | Mantener en modo de bajo consumo energético             | 2     |
      | true        | false     | true     | Apagar sistema de climatización y emitir alerta sonora  | 0     |
      | true        | true      | true     | Apagar sistema de climatización y emitir alerta sonora  | 0     |
      | false       | false     | false    | Mantener sistema apagado                                | 3     |