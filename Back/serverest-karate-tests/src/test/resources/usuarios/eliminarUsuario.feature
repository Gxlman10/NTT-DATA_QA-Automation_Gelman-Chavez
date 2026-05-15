Feature: Eliminar Usuario - DELETE /usuarios/{_id}

  Background:
    * url baseUrl
    * call read('classpath:helpers/DataGenerator.feature')
    Given path '/usuarios'
    And request usuarioAdmin
    When method POST
    Then status 201
    * def usuarioId = response._id

  @smoke @positivo @regresion
  Scenario: Eliminar usuario existente exitosamente
    Given path '/usuarios/' + usuarioId
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

  @positivo @regresion
  Scenario: Verificar que el usuario ya no existe tras eliminarlo
    # eliminar
    Given path '/usuarios/' + usuarioId
    When method DELETE
    Then status 200
    # confirmar que el GET ya no lo encuentra
    Given path '/usuarios/' + usuarioId
    When method GET
    Then status 400
    And match response.message == 'Usuário não encontrado'

  @negativo @regresion
  Scenario: Eliminar usuario con ID inexistente retorna mensaje informativo
    Given path '/usuarios/idfalsaso000000'
    When method DELETE
    Then status 200
    And match response.message == 'Nenhum registro excluído'

