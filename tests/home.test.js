const { test, expect } = require('@playwright/test');
const HomePage = require('../pages/homePage');
const LoginPage = require('../pages/loginPage'); // Ensure LoginPage is imported

test('Verify home page loads correctly', async ({ page }) => {
  const homePage = new HomePage(page);
  await page.goto('https://alpha.mojomotor.in/user/home');
  await homePage.login(); // Ensure the user is logged in
  expect(await homePage.isLoggedIn()).toBeTruthy();
});
