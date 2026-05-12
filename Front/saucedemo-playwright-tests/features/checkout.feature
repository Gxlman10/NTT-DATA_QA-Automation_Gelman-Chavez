Feature: Completar proceso de compra

  Background:
    Given el usuario inició sesión como "standard_user"
    And agregó "Sauce Labs Backpack" al carrito
    And navegó al carrito

  Scenario: Completar compra hasta la confirmación
    When procede al checkout
    And completa los datos con nombre "Gelman" apellido "Test" y código postal "12345"
    And confirma la orden
    Then debe ver el mensaje de confirmación "Thank you for your order!"

  Scenario: Ver el resumen de la orden antes de confirmar
    When procede al checkout
    And completa los datos con nombre "Gelman" apellido "Test" y código postal "12345"
    Then debe ver el producto "Sauce Labs Backpack" en el resumen
    And el total debe contener "32.39"
