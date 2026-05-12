const { Given, When, Then } = require('@cucumber/cucumber');
const assert = require('assert');
const LoginPage = require('../pages/LoginPage');

Given('el usuario está en la página de login', async function () {
  const loginPage = new LoginPage(this.page);
  await loginPage.navigate();
});

// step compartido: usado también en inventory, cart y checkout como Background
Given('el usuario inició sesión como {string}', async function (username) {
  const loginPage = new LoginPage(this.page);
  await loginPage.navigate();
  await loginPage.login(username, 'secret_sauce');
});

When('ingresa usuario {string} y contraseña {string}', async function (username, password) {
  const loginPage = new LoginPage(this.page);
  await loginPage.login(username, password);
});

Then('debe ser redirigido a la página de productos', async function () {
  const loginPage = new LoginPage(this.page);
  const url = await loginPage.getCurrentUrl();
  assert.ok(url.includes('/inventory.html'), `URL esperada con /inventory.html, recibida: ${url}`);
});

Then('debe ver el mensaje de error {string}', async function (expectedMessage) {
  const loginPage = new LoginPage(this.page);
  const actualMessage = await loginPage.getErrorMessage();
  assert.strictEqual(actualMessage, expectedMessage);
});
