import { chromium } from "playwright";

const main = async () => {
  const browser = await chromium.launch( {
      executablePath: process.env.PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH,
  });
  const page = await browser.newPage();

  await page.goto("http://localhost:4321/", { waitUntil: "networkidle" });

  await page.emulateMedia({ media: "screen" });

  await page.pdf({
    path: "public/pavel_anpin_cv.pdf",
    margin: { top: "50px", bottom: "80px" },
    printBackground: true,
  });

  return browser.close();
};

main();
