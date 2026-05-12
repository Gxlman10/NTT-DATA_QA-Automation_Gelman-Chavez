@ignore
Feature: Generador de datos únicos

  # no ejecutar directo, se llama con: * call read('classpath:helpers/DataGenerator.feature')

  Scenario: Generar datos de usuario únicos

    # timestamp para que el email nunca se repita entre ejecuciones
    * def timestamp = new Date().getTime()

    * def nome      = 'Usuario Test ' + timestamp
    * def email     = 'user_' + timestamp + '@qatest.com'
    * def password  = 'Senha@' + timestamp
    * def adminTrue  = 'true'
    * def adminFalse = 'false'

    # objetos listos para usar como body en los features
    * def usuarioAdmin = { nome: '#(nome)', email: '#(email)', password: '#(password)', administrador: '#(adminTrue)' }
    * def usuarioNormal = { nome: '#(nome)', email: '#(email)', password: '#(password)', administrador: '#(adminFalse)' }
