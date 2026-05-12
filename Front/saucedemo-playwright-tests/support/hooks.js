const { Before, After, AfterStep } = require('@cucumber/cucumber');

// abre un browser limpio antes de cada escenario
Before(async function () {
  await this.openBrowser();
});

// cierra el browser al terminar cada escenario
After(async function (scenario) {
  // si el escenario falló, toma screenshot antes de cerrar
  if (scenario.result.status === 'FAILED') {
    const screenshot = await this.page.screenshot();
    await this.attach(screenshot, 'image/png');
  }
  await this.closeBrowser();
});
