const { When, Then, Given } = require('@cucumber/cucumber');
const assert = require('assert');
const InventoryPage = require('../pages/InventoryPage');

Given('agregó {string} al carrito', async function (productName) {
  const inventoryPage = new InventoryPage(this.page);
  await inventoryPage.addProductToCart(productName);
});

Given('navegó al carrito', async function () {
  const inventoryPage = new InventoryPage(this.page);
  await inventoryPage.goToCart();
});

When('agrega {string} al carrito', async function (productName) {
  const inventoryPage = new InventoryPage(this.page);
  await inventoryPage.addProductToCart(productName);
});

Then('el contador del carrito debe mostrar {string}', async function (expectedCount) {
  const inventoryPage = new InventoryPage(this.page);
  const actualCount = await inventoryPage.getCartBadgeCount();
  assert.strictEqual(actualCount, expectedCount);
});

Then('el botón de {string} debe decir {string}', async function (productName, expectedText) {
  const slug = productName.toLowerCase().replace(/ /g, '-');
  const removeSelector = `[data-test="remove-${slug}"]`;
  const buttonText = await this.page.locator(removeSelector).innerText();
  assert.strictEqual(buttonText.trim(), expectedText);
});
