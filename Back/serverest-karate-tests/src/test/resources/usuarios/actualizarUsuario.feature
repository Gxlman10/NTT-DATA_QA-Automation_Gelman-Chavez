Feature: Actualizar Usuario - PUT /usuarios/{_id}

  Background:
    * url baseUrl
    # crea un usuario nuevo antes de cada escenario y guarda su _id
    * call read('classpath:helpers/DataGenerator.feature')
    Given path '/usuarios'
    And request usuarioAdmin
    When method POST
    Then status 201
    * def usuarioId = response._id

  @smoke
  Scenario: Actualizar todos los datos de un usuario existente
    * def timestamp2 = new Date().getTime() + 1
    * def nomeActualizado = 'Nombre Actualizado ' + timestamp2
    * def emailActualizado = 'updated_' + timestamp2 + '@qatest.com'
    * def passActualizado = 'NuevaSenha' + timestamp2
    * def nuevosDatos = { nome: '#(nomeActualizado)', email: '#(emailActualizado)', password: '#(passActualizado)', administrador: 'false' }
    Given path '/usuarios/' + usuarioId
    And request nuevosDatos
    When method PUT
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

  # ojo: si el id no existe, serverest hace upsert (crea el usuario) y retorna 201
  Scenario: PUT con ID inexistente crea el usuario (comportamiento de upsert)
    * def timestamp2 = new Date().getTime() + 1
    * def nomeUpsert = 'Upsert User ' + timestamp2
    * def emailUpsert = 'upsert_' + timestamp2 + '@qatest.com'
    * def nuevoDato = { nome: '#(nomeUpsert)', email: '#(emailUpsert)', password: 'Senha123', administrador: 'false' }
    Given path '/usuarios/idInexistente000000000'
    And request nuevoDato
    When method PUT
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  Scenario: No debe actualizar usuario con email ya registrado por otro usuario
    # crear segundo usuario para tener un email en conflicto
    * def timestamp2 = new Date().getTime() + 999
    * def emailOtroUsuario = 'otro_' + timestamp2 + '@qatest.com'
    * def otroUsuario = { nome: 'Otro User', email: '#(emailOtroUsuario)', password: 'Senha123', administrador: 'false' }
    Given path '/usuarios'
    And request otroUsuario
    When method POST
    Then status 201
    # intentar pisar el email del segundo con el primer usuario
    Given path '/usuarios/' + usuarioId
    And request { nome: '#(nome)', email: '#(emailOtroUsuario)', password: '#(password)', administrador: 'true' }
    When method PUT
    Then status 400
    And match response == read('classpath:schemas/mensajeError.json')
    And match response.message == 'Este email já está sendo usado'
