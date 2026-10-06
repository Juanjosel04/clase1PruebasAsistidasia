Feature: Evaluación de Estado del Sistema Barista

  @smoke @GH-1
  Scenario: Consultar estado actual del robot cafetero

    Given url baseUrl
    And path 'barista-bot/estado'
    And headers { Content-Type: 'application/json', Accept: 'application/json' }
    When method get
    Then status 200
    And match response.estadoActual == '#present'
    And match responseStatus == 200
