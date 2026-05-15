const { When, Then } = require('@cucumber/cucumber');
const assert = require('assert');
const CartPage = require('../pages/CartPage');
const InventoryPage = require('../pages/InventoryPage');

When('navega al carrito', async function () {
  const inventoryPage = new InventoryPage(this.page);
  await inventoryPage.goToCart();
});

Then('debe ver {string} en el carrito', async function (expectedProductName) {
  const cartPage = new CartPage(this.page);
  const actualName = await cartPage.getItemName();
  assert.strictEqual(actualName, expectedProductName);
});

Then('el precio del producto debe ser {string}', async function (expectedPrice) {
  const cartPage = new CartPage(this.page);
  const actualPrice = await cartPage.getItemPrice();
  assert.strictEqual(actualPrice, expectedPrice);
});

Then('la cantidad del producto debe ser {string}', async function (expectedQty) {
  const cartPage = new CartPage(this.page);
  const actualQty = await cartPage.getItemQuantity();
  assert.strictEqual(actualQty, expectedQty);
});
