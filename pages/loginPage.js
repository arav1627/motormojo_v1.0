require('dotenv').config();

class LoginPage {
  constructor(page) {
    this.page = page;
    this.emailField = '#email_id';
    this.passwordField = '#password';
    this.loginButton = '.primarybt';
  }

  async navigate() {
    await this.page.goto(process.env.BASE_URL, { waitUntil: 'networkidle' });
    await this.page.waitForSelector('#login-form', { timeout: 60000 }); // Wait for the login form to appear
  }

  async login() {
    console.log('Navigating to login page...');
    await this.page.waitForSelector(this.emailField, { timeout: 60000 });

    console.log('Email field found, filling email...');
    await this.page.fill(this.emailField, process.env.EMAIL_ID);
    
    await this.page.waitForSelector(this.passwordField, { timeout: 60000 });
    console.log('Password field found, filling password...');
    await this.page.fill(this.passwordField, process.env.PASSWORD);

    await this.page.waitForSelector(this.loginButton, { timeout: 60000 });
    console.log('Login button found, clicking login...');
    await this.page.click(this.loginButton);

    // Wait for successful login - Change selector to something visible only after login
    await this.page.waitForSelector('.dashboard', { timeout: 60000 }).catch(() => {
      console.error('Login might have failed! Dashboard not found.');
    });

    console.log('Login completed. Checking redirection...');
    await this.page.waitForLoadState('networkidle');
    console.log('Current URL after login:', this.page.url());
  }
}

export default LoginPage;
