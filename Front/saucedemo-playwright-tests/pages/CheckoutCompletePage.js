class CheckoutCompletePage {

  constructor(page) {
    this.page = page;
    this.confirmationHeader = '[data-test="complete-header"]';
    this.confirmationText   = '[data-test="complete-text"]';
    this.backHomeButton     = '[data-test="back-to-products"]';
  }

  async getConfirmationHeader() {
    return this.page.locator(this.confirmationHeader).innerText();
  }

  async getConfirmationText() {
    return this.page.locator(this.confirmationText).innerText();
  }

  async backToProducts() {
    await this.page.click(this.backHomeButton);
  }

  async getCurrentUrl() {
    return this.page.url();
  }

}

module.exports = CheckoutCompletePage;
