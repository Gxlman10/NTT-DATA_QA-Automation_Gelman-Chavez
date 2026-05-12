const { setWorldConstructor, World, setDefaultTimeout } = require('@cucumber/cucumber');
const { chromium } = require('playwright');

// el timeout por defecto de cucumber es 5s, muy poco para lanzar un browser
setDefaultTimeout(30000);

class CustomWorld extends World {

  async openBrowser() {
    // headless por defecto, se desactiva con: npm run test:headed
    const headless = process.env.HEADLESS !== 'false';

    this.browser = await chromium.launch({ headless });
    this.context = await this.browser.newContext();
    this.page    = await this.context.newPage();
  }

  async closeBrowser() {
    await this.browser.close();
  }

}

setWorldConstructor(CustomWorld);
