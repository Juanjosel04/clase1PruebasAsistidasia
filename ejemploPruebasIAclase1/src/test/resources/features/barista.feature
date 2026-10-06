Feature: Robot cafetero basado en tabla de transicion de estados

  Background:
    * def transiciones =
      """
      {
        "En Espera": {
          "Iniciar Pedido": {"siguiente": "Moliendo", "valida": true},
          "Terminar Molienda": {"siguiente": "En Espera", "valida": false},
          "Alcanzar Temperatura": {"siguiente": "En Espera", "valida": false},
          "Terminar Llenado": {"siguiente": "En Espera", "valida": false},
          "Sin Ingredientes": {"siguiente": "En Espera", "valida": false},
          "Recargar y Reiniciar": {"siguiente": "En Espera", "valida": false}
        },

        "Moliendo": {
          "Iniciar Pedido": {"siguiente": "Moliendo", "valida": false},
          "Terminar Molienda": {"siguiente": "Calentando Agua", "valida": true},
          "Alcanzar Temperatura": {"siguiente": "Moliendo", "valida": false},
          "Terminar Llenado": {"siguiente": "Moliendo", "valida": false},
          "Sin Ingredientes": {"siguiente": "Error de Insumos", "valida": true},
          "Recargar y Reiniciar": {"siguiente": "Moliendo", "valida": false}
        },

        "Calentando Agua": {
          "Iniciar Pedido": {"siguiente": "Calentando Agua", "valida": false},
          "Terminar Molienda": {"siguiente": "Calentando Agua", "valida": false},
          "Alcanzar Temperatura": {"siguiente": "Sirviendo", "valida": true},
          "Terminar Llenado": {"siguiente": "Calentando Agua", "valida": false},
          "Sin Ingredientes": {"siguiente": "Error de Insumos", "valida": true},
          "Recargar y Reiniciar": {"siguiente": "Calentando Agua", "valida": false}
        },

        "Sirviendo": {
          "Iniciar Pedido": {"siguiente": "Sirviendo", "valida": false},
          "Terminar Molienda": {"siguiente": "Sirviendo", "valida": false},
          "Alcanzar Temperatura": {"siguiente": "Sirviendo", "valida": false},
          "Terminar Llenado": {"siguiente": "En Espera", "valida": true},
          "Sin Ingredientes": {"siguiente": "Error de Insumos", "valida": true},
          "Recargar y Reiniciar": {"siguiente": "Sirviendo", "valida": false}
        },

        "Error de Insumos": {
          "Iniciar Pedido": {"siguiente": "Error de Insumos", "valida": false},
          "Terminar Molienda": {"siguiente": "Error de Insumos", "valida": false},
          "Alcanzar Temperatura": {"siguiente": "Error de Insumos", "valida": false},
          "Terminar Llenado": {"siguiente": "Error de Insumos", "valida": false},
          "Sin Ingredientes": {"siguiente": "Error de Insumos", "valida": false},
          "Recargar y Reiniciar": {"siguiente": "En Espera", "valida": true}
        }
      }
      """

  Scenario Outline: Evaluar cada fila de la matriz estado-evento

    * def estado = '<estado>'
    * def evento = '<evento>'
    * def siguienteEsperado = '<siguiente>'
    * def validezEsperada = '<validez>'

    * def transicion = transiciones[estado][evento]

    Then match transicion.siguiente == siguienteEsperado
    And match transicion.valida == (validezEsperada == 'valida')

    Examples:
      | estado          | evento               | siguiente        | validez  |
      | En Espera       | Iniciar Pedido       | Moliendo         | valida   |
      | En Espera       | Terminar Molienda   | En Espera        | invalida |
      | En Espera       | Alcanzar Temperatura | En Espera        | invalida |
      | En Espera       | Terminar Llenado    | En Espera        | invalida |
      | En Espera       | Sin Ingredientes     | En Espera        | invalida |
      | En Espera       | Recargar y Reiniciar | En Espera        | invalida |
      | Moliendo         | Iniciar Pedido       | Moliendo         | invalida |
      | Moliendo         | Terminar Molienda   | Calentando Agua  | valida   |
      | Moliendo         | Alcanzar Temperatura | Moliendo         | invalida |
      | Moliendo         | Terminar Llenado    | Moliendo         | invalida |
      | Moliendo         | Sin Ingredientes     | Error de Insumos | valida   |
      | Moliendo         | Recargar y Reiniciar | Moliendo         | invalida |
      | Calentando Agua  | Iniciar Pedido       | Calentando Agua  | invalida |
      | Calentando Agua  | Terminar Molienda   | Calentando Agua  | invalida |
      | Calentando Agua  | Alcanzar Temperatura | Sirviendo        | valida   |
      | Calentando Agua  | Terminar Llenado    | Calentando Agua  | invalida |
      | Calentando Agua  | Sin Ingredientes     | Error de Insumos | valida   |
      | Calentando Agua  | Recargar y Reiniciar | Calentando Agua  | invalida |
      | Sirviendo        | Iniciar Pedido       | Sirviendo        | invalida |
      | Sirviendo        | Terminar Molienda   | Sirviendo        | invalida |
      | Sirviendo        | Alcanzar Temperatura | Sirviendo        | invalida |
      | Sirviendo        | Terminar Llenado    | En Espera        | valida   |
      | Sirviendo        | Sin Ingredientes     | Error de Insumos | valida   |
      | Sirviendo        | Recargar y Reiniciar | Sirviendo        | invalida |
      | Error de Insumos | Iniciar Pedido       | Error de Insumos | invalida |
      | Error de Insumos | Terminar Molienda   | Error de Insumos | invalida |
      | Error de Insumos | Alcanzar Temperatura | Error de Insumos | invalida |
      | Error de Insumos | Terminar Llenado    | Error de Insumos | invalida |
      | Error de Insumos | Sin Ingredientes     | Error de Insumos | invalida |
      | Error de Insumos | Recargar y Reiniciar | En Espera        | valida   |