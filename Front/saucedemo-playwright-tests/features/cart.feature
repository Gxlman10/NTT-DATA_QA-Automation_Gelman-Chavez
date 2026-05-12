Feature: Ver productos en el carrito

  Background:
    Given el usuario inició sesión como "standard_user"
    And agregó "Sauce Labs Backpack" al carrito

  Scenario: Ver el producto agregado en el carrito
    When navega al carrito
    Then debe ver "Sauce Labs Backpack" en el carrito
    And el precio del producto debe ser "$29.99"

  Scenario: La cantidad del producto en el carrito es correcta
    When navega al carrito
    Then la cantidad del producto debe ser "1"
