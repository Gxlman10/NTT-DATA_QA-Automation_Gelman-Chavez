@ignore
Feature: Generador de datos únicos

  # llamar con call read('classpath:helpers/DataGenerator.feature')

  Scenario: Generar datos de usuario únicos

    * def timestamp = new Date().getTime()

    * def nome      = 'Usuario Test ' + timestamp
    * def email     = 'user_' + timestamp + '@qatest.com'
    * def password  = 'Senha@' + timestamp
    * def adminTrue  = 'true'
    * def adminFalse = 'false'

    # bodys 
    * def usuarioAdmin  = { nome: '#(nome)', email: '#(email)', password: '#(password)', administrador: '#(adminTrue)' }
    * def usuarioNormal = { nome: '#(nome)', email: '#(email)', password: '#(password)', administrador: '#(adminFalse)' }
