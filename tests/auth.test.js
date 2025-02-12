import { test, expect } from '@playwright/test';
import LoginPage from '../pages/loginPage.js';
import HomePage from '../pages/homePage.js';

test.describe('Authentication Tests', () => {
  test('Login with valid credentials', async ({ page }) => {
    const loginPage = new LoginPage(page);
    const homePage = new HomePage(page);

    await loginPage.navigate();
    await loginPage.login();

    expect(await homePage.isLoggedIn()).toBeTruthy();
  });
});
