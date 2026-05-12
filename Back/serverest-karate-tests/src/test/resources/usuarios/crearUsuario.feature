Feature: Registrar Usuario - POST /usuarios

  Background:
    * url baseUrl
    * call read('classpath:helpers/DataGenerator.feature')

  @smoke
  Scenario: Registrar usuario administrador con datos válidos
    Given path '/usuarios'
    And request usuarioAdmin
    When method POST
    Then status 201
    And match response == read('classpath:schemas/mensajeCreado.json')
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  Scenario: Registrar usuario no administrador con datos válidos
    Given path '/usuarios'
    And request usuarioNormal
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

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

  Scenario: No debe registrar usuario sin el campo nome
    Given path '/usuarios'
    And request { email: '#(email)', password: '#(password)', administrador: 'true' }
    When method POST
    Then status 400
    And match response.nome == '#string'

  Scenario: No debe registrar usuario sin el campo email
    Given path '/usuarios'
    And request { nome: '#(nome)', password: '#(password)', administrador: 'true' }
    When method POST
    Then status 400
    And match response.email == '#string'

  Scenario: No debe registrar usuario sin el campo password
    Given path '/usuarios'
    And request { nome: '#(nome)', email: '#(email)', administrador: 'true' }
    When method POST
    Then status 400
    And match response.password == '#string'

  Scenario: No debe registrar usuario con email en formato invalido
    Given path '/usuarios'
    And request { nome: '#(nome)', email: 'email-invalido-sin-arroba', password: '#(password)', administrador: 'true' }
    When method POST
    Then status 400
    And match response.email == '#string'
