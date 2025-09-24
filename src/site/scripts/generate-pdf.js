import { chromium } from "playwright";

const main = async () => {
  const browser = await chromium.launch( {
      executablePath: process.env.PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH,
  });
  const page = await browser.newPage();

  // Set print mode URL parameter
  await page.goto("http://localhost:4321/cv?pdf=true", { waitUntil: "networkidle" });

  // Apply print-friendly styles
  await page.evaluate(() => {
    // Force light theme
    document.documentElement.classList.add('light-theme');
    document.documentElement.classList.add('pdf-mode');
    
    // Remove all background elements and styling
    document.body.style.backgroundColor = 'white';
    document.body.style.color = 'black';
    
    // Apply print styles to match native print dialog
    const style = document.createElement('style');
    style.textContent = `
      .cv-container {
        box-shadow: none !important;
        border: none !important;
        background: white !important;
        color: black !important;
        padding: 2rem !important;
        max-width: 100% !important;
        backdrop-filter: none !important;
        margin: 0 auto !important;
      }
      .controls-menu, .not-prose { display: none !important; }
      body { background-image: none !important; }
      a { color: black !important; }
    `;
    document.head.appendChild(style);
    
    // Add some delay to ensure styles are applied
    return new Promise(resolve => setTimeout(resolve, 500));
  });
  
  // Use print media type for proper rendering
  await page.emulateMedia({ media: "print" });

  await page.pdf({
    path: "public/pavel_anpin_cv.pdf",
    margin: { top: "5px", right: "5px", bottom: "5px", left: "5px" },
    printBackground: false,
    format: 'A4',
    preferCSSPageSize: true,
  });

  return browser.close();
};

main();
