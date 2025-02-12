export async function waitForElement(page, selector) {
    await page.waitForSelector(selector, { state: 'visible' });
  }
  