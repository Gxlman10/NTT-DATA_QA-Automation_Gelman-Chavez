Feature: Agregar producto al carrito

  Background:
    Given el usuario inició sesión como "standard_user"

  Scenario: Agregar un producto al carrito desde la página de productos
    When agrega "Sauce Labs Backpack" al carrito
    Then el contador del carrito debe mostrar "1"

  Scenario: El botón cambia a Remove tras agregar el producto
    When agrega "Sauce Labs Backpack" al carrito
    Then el botón de "Sauce Labs Backpack" debe decir "Remove"
