class InventoryPage {

  constructor(page) {
    this.page = page;
    this.pageTitle      = '[data-test="title"]';
    this.cartLink       = '[data-test="shopping-cart-link"]';
    this.cartBadge      = '[data-test="shopping-cart-badge"]';
    this.inventoryItem  = '[data-test="inventory-item"]';
  }

  // el selector del botón varía por producto: add-to-cart-sauce-labs-backpack
  addToCartSelector(productName) {
    const slug = productName.toLowerCase().replace(/ /g, '-');
    return `[data-test="add-to-cart-${slug}"]`;
  }

  async addProductToCart(productName) {
    await this.page.click(this.addToCartSelector(productName));
  }

  async getCartBadgeCount() {
    return this.page.locator(this.cartBadge).innerText();
  }

  async goToCart() {
    await this.page.click(this.cartLink);
  }

  async getPageTitle() {
    return this.page.locator(this.pageTitle).innerText();
  }

}

module.exports = InventoryPage;
