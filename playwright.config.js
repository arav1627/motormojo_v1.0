import { defineConfig } from '@playwright/test';
import dotenv from 'dotenv';

dotenv.config();

export default defineConfig({
  testDir: './tests',
  timeout: 30000,
  expect: { timeout: 5000 },
  reporter: [['list'], ['html', { outputFolder: 'playwright-report' }]],
  use: {
    headless: false,
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
    baseURL: process.env.BASE_URL,
    trace: 'on-first-retry',
  },
});
