const { When, Then } = require('@cucumber/cucumber');
const assert = require('assert');
const CartPage = require('../pages/CartPage');
const CheckoutPage = require('../pages/CheckoutPage');
const CheckoutCompletePage = require('../pages/CheckoutCompletePage');

When('procede al checkout', async function () {
  const cartPage = new CartPage(this.page);
  await cartPage.goToCheckout();
});

When('completa los datos con nombre {string} apellido {string} y código postal {string}',
  async function (firstName, lastName, postalCode) {
    const checkoutPage = new CheckoutPage(this.page);
    await checkoutPage.fillPersonalInfo(firstName, lastName, postalCode);
    await checkoutPage.continue();
  }
);

When('confirma la orden', async function () {
  const checkoutPage = new CheckoutPage(this.page);
  await checkoutPage.finish();
});

Then('debe ver el mensaje de confirmación {string}', async function (expectedHeader) {
  const completePage = new CheckoutCompletePage(this.page);
  const actualHeader = await completePage.getConfirmationHeader();
  assert.strictEqual(actualHeader, expectedHeader);
});

Then('debe ver el producto {string} en el resumen', async function (expectedProductName) {
  const checkoutPage = new CheckoutPage(this.page);
  const actualName = await checkoutPage.getItemName();
  assert.strictEqual(actualName, expectedProductName);
});

Then('el total debe contener {string}', async function (expectedPartialTotal) {
  const checkoutPage = new CheckoutPage(this.page);
  const actualTotal = await checkoutPage.getTotal();
  assert.ok(actualTotal.includes(expectedPartialTotal),
    `Total esperado contener "${expectedPartialTotal}", recibido: "${actualTotal}"`
  );
});
