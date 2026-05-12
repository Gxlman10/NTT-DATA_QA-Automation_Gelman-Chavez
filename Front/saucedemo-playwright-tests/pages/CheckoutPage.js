class CheckoutPage {

  constructor(page) {
    this.page = page;
    // step 1 — información personal
    this.firstNameInput = '[data-test="firstName"]';
    this.lastNameInput  = '[data-test="lastName"]';
    this.postalCodeInput = '[data-test="postalCode"]';
    this.continueButton = '[data-test="continue"]';
    this.cancelButton   = '[data-test="cancel"]';
    this.errorMessage   = '[data-test="error"]';
    // step 2 — resumen de orden
    this.subtotalLabel  = '[data-test="subtotal-label"]';
    this.taxLabel       = '[data-test="tax-label"]';
    this.totalLabel     = '[data-test="total-label"]';
    this.finishButton   = '[data-test="finish"]';
    this.itemName       = '[data-test="inventory-item-name"]';
  }

  async fillPersonalInfo(firstName, lastName, postalCode) {
    await this.page.fill(this.firstNameInput, firstName);
    await this.page.fill(this.lastNameInput, lastName);
    await this.page.fill(this.postalCodeInput, postalCode);
  }

  async continue() {
    await this.page.click(this.continueButton);
  }

  async getTotal() {
    return this.page.locator(this.totalLabel).innerText();
  }

  async getSubtotal() {
    return this.page.locator(this.subtotalLabel).innerText();
  }

  async getItemName() {
    return this.page.locator(this.itemName).innerText();
  }

  async finish() {
    await this.page.click(this.finishButton);
  }

  async getErrorMessage() {
    return this.page.locator(this.errorMessage).innerText();
  }

}

module.exports = CheckoutPage;
