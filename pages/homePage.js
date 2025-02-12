class HomePage {
  constructor(page) {
    this.page = page;
  }

  async login() {
    // Implement the login logic here
    const loginPage = new LoginPage(this.page);
    await loginPage.navigate();
    await loginPage.login();
  }

  async isLoggedIn() {
    // Implement the logic to check if the user is logged in
    return await this.page.$('#logout-button') !== null;
  }
}

module.exports = HomePage;
