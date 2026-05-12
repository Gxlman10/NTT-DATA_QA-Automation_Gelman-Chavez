Feature: Buscar Usuario por ID - GET /usuarios/{_id}

  Background:
    * url baseUrl
    # crea un usuario fresco y guarda su id para cada test
    * call read('classpath:helpers/DataGenerator.feature')
    Given path '/usuarios'
    And request usuarioAdmin
    When method POST
    Then status 201
    * def usuarioId = response._id

  @smoke
  Scenario: Buscar usuario existente por su ID
    Given path '/usuarios/' + usuarioId
    When method GET
    Then status 200
    And match response == read('classpath:schemas/usuario.json')
    And match response._id == usuarioId
    And match response.email == email

  Scenario: Buscar usuario valida todos los campos del objeto
    Given path '/usuarios/' + usuarioId
    When method GET
    Then status 200
    And match response.nome == '#string'
    And match response.email == '#string'
    And match response.password == '#string'
    And match response.administrador == '#string'
    And match response._id == '#string'

  Scenario: No debe encontrar usuario con ID inexistente
    Given path '/usuarios/idinvalido000000'
    When method GET
    Then status 400
    And match response == read('classpath:schemas/mensajeError.json')
    And match response.message == 'Usuário não encontrado'
