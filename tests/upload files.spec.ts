// import { expect, test } from '@playwright/test';


// test('Upload Files ', async ({ page }) => {
//   await page.goto('http://gestamp.ddns.net/gestamp/auth/login');
//   await page.locator('input[name="email"]').fill('test.gamekittisak@gmail.com');
//   await page.locator('input[name="password"]').fill('P@ssw0rd');
//   await page.getByRole('button', { name: 'Sign In', exact: true }).click();
//   await page.getByRole('button', { name: 'Upload' }).click();
//   await page.locator('#file').setInputFiles('Data/Auto_GSD_TS_T1.xlsx');
//   await page.getByRole('button', { name: 'Upload' }).click();
//   await expect(page.getByRole('heading', { name: 'Upload Fail' })).toHaveText('Upload Fail');
//   await page.getByRole('button', { name: 'Close' }).click();
//   await page.getByRole('row', { name: 'Game Kittisak' }).getByRole('button').nth(2).click();
//   await page.getByRole('button', { name: 'Confirm' }).click();
//   await page.locator('div').filter({ hasText: /^All Status$/ }).nth(1).click();
//   await page.getByRole('option', { name: 'All Status' }).locator('span').click();
//   await page.getByRole('button', { name: 'Search' }).click();
//   await page.locator('div').filter({ hasText: /^Uploaded Date From$/ }).getByLabel('Open calendar').click();
//   await page.getByLabel('20 July 2023').click();
//   await page.getByRole('button', { name: 'Search' }).click();
//   await page.locator('div').filter({ hasText: /^Uploaded Date From$/ }).getByLabel('Open calendar').click();
//   await page.locator('.cdk-overlay-backdrop').click();
//   await page.locator('div').filter({ hasText: /^Uploaded Date To$/ }).getByLabel('Open calendar').click();
//   await page.getByLabel('20 July 2023').click();
//   await page.getByRole('button', { name: 'Search' }).click();
//   await page.locator('div').filter({ hasText: /^Uploaded Date From$/ }).getByLabel('Open calendar').click();
//   await page.getByLabel('20 July 2023').click();
//   await page.locator('div').filter({ hasText: /^Uploaded Date To$/ }).getByLabel('Open calendar').click();
//   await page.getByLabel('20 July 2023').click();
//   await page.getByRole('button', { name: 'Search' }).click();
// });


