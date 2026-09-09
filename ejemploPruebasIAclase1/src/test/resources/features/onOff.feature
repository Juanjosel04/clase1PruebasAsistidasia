Feature: Yo como tester quiero probar la funcionalidad de interruptor

  Scenario: Verificar el estado del interruptor en un momento dado
    Given url 'https://statemachine--maria7221.replit.app/api/'
    And path 'switch/state'
    And headers { Content-Type: 'application/json', Accept: 'application/json' }
    when method get
    * print 'Estado actual del interruptor:' , response.state
    * match respondeStatus == 200