import { chromium } from "playwright";

const main = async () => {
  const browser = await chromium.launch( {
      executablePath: process.env.PLAYWRIGHT_LAUNCH_OPTIONS_EXECUTABLE_PATH,
  });
  const page = await browser.newPage();

  // Set print mode URL parameter
  // Allow parametrization via env vars or CLI arg
  // Env vars: PDF_BASE_URL, PDF_PATH, PDF_QUERY, PDF_OUTPUT
  // CLI: node scripts/generate-pdf.js /cv_av
  const baseUrl = "http://localhost:4321";
  const pathArg =  process.argv[2] || "/cv";
  const query = "pdf=true";
  const url = `${baseUrl}${pathArg}${pathArg.includes("?") ? "&" : "?"}${query}`;
  await page.goto(url, { waitUntil: "networkidle" });

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
    path: process.argv[3] ||  "public/pavel_anpin_cv.pdf",
    margin: { top: "0px", right: "0px", bottom: "0px", left: "0px" },
    printBackground: false,
    format: 'A4',
    preferCSSPageSize: true,
  });

  return browser.close();
};

main();

