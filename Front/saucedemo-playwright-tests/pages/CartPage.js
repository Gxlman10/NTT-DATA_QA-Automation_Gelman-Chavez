class CartPage {

  constructor(page) {
    this.page = page;
    this.pageTitle        = '[data-test="title"]';
    this.itemName         = '[data-test="inventory-item-name"]';
    this.itemPrice        = '[data-test="inventory-item-price"]';
    this.itemQuantity     = '[data-test="item-quantity"]';
    this.checkoutButton   = '[data-test="checkout"]';
    this.continueShoppingButton = '[data-test="continue-shopping"]';
  }

  async getItemName() {
    return this.page.locator(this.itemName).first().innerText();
  }

  async getItemPrice() {
    return this.page.locator(this.itemPrice).first().innerText();
  }

  async getItemQuantity() {
    return this.page.locator(this.itemQuantity).first().innerText();
  }

  async goToCheckout() {
    await this.page.click(this.checkoutButton);
  }

  async getPageTitle() {
    return this.page.locator(this.pageTitle).innerText();
  }

}

module.exports = CartPage;
