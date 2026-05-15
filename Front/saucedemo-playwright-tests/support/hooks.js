const { Before, After, AfterStep } = require('@cucumber/cucumber');


Before(async function () {
  await this.openBrowser();
});


After(async function (scenario) {
  if (scenario.result.status === 'FAILED') {
    const screenshot = await this.page.screenshot();
    await this.attach(screenshot, 'image/png');
  }
  await this.closeBrowser();
});
