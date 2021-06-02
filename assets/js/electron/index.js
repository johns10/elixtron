const { ipcMain, app, BrowserWindow } = require('electron');
const puppeteer = require('puppeteer');

var elixtron = {
  browser: null
}

function main() {
  var win = new BrowserWindow({
    width: 1600,
    height: 800,
    webPreferences: {
      preload: require('path').join(__dirname, './preload.js'),
      devTools: true
    }
  })
  win.loadURL("https://dev.elixtron.com:4000")
}

ipcMain.on('openBrowser', async (event) => { 
  const browser = await puppeteer.launch({ headless: false });
  elixtron.browser = browser
})

ipcMain.on('closeBrowser', async (event) => { 
  browser = elixtron.browser
  await browser.close()
})

app.whenReady().then(main)