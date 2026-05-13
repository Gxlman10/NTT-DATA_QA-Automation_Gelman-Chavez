Feature: Listar Usuarios - GET /usuarios

  Background:
    * url baseUrl

  @smoke @positivo @regresion
  Scenario: Obtener lista completa de usuarios
    Given path '/usuarios'
    When method GET
    Then status 200
    And match response == read('classpath:schemas/listaUsuarios.json')
    And assert response.quantidade >= 0
    And match response.usuarios == '#array'

  @positivo @regresion
  Scenario: Cada usuario en la lista tiene la estructura correcta
    Given path '/usuarios'
    When method GET
    Then status 200
    And match each response.usuarios == read('classpath:schemas/usuario.json')

  @positivo @regresion
  Scenario: Filtrar usuarios por administrador
    Given path '/usuarios'
    And param administrador = 'true'
    When method GET
    Then status 200
    And assert response.quantidade >= 0

  @negativo @regresion
  Scenario: Filtrar por nombre inexistente retorna lista vacía
    Given path '/usuarios'
    And param nome = 'DragonBallZ999'
    When method GET
    Then status 200
    And match response.quantidade == 0
    And match response.usuarios == []
