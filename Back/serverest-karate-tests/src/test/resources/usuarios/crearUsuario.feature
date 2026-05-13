Feature: Registrar Usuario - POST /usuarios

  Background:
    * url baseUrl
    * call read('classpath:helpers/DataGenerator.feature')

  @smoke @positivo @regresion
  Scenario: Registrar usuario administrador con datos válidos
    Given path '/usuarios'
    And request usuarioAdmin
    When method POST
    Then status 201
    And match response == read('classpath:schemas/mensajeCreado.json')
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  @positivo @regresion
  Scenario: Registrar usuario no administrador con datos válidos
    Given path '/usuarios'
    And request usuarioNormal
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  @negativo @regresion
  Scenario: No debe registrar usuario con email duplicado
    # primer registro
    Given path '/usuarios'
    And request usuarioAdmin
    When method POST
    Then status 201
    # segundo intento con el mismo email, debe fallar
    Given path '/usuarios'
    And request usuarioAdmin
    When method POST
    Then status 400
    And match response == read('classpath:schemas/mensajeError.json')
    And match response.message == 'Este email já está sendo usado'

  @negativo @regresion
  Scenario Outline: No debe registrar usuario con campo <campo> inválido
    Given path '/usuarios'
    And request <body>
    When method POST
    Then status 400
    And match response.<campo> == '#string'

    Examples:
      | campo      | body                                                                                  |
      | nome       | { email: '#(email)', password: '#(password)', administrador: 'true' }                |
      | email      | { nome: '#(nome)', password: '#(password)', administrador: 'true' }                  |
      | password   | { nome: '#(nome)', email: '#(email)', administrador: 'true' }                        |
      | email      | { nome: '#(nome)', email: 'email-invalido-sin-arroba', password: '#(password)', administrador: 'true' } |
