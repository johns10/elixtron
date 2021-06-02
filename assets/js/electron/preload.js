const { ipcRenderer, contextBridge } = require('electron')

contextBridge.exposeInMainWorld('elixtron', {
  openBrowser: () => { ipcRenderer.send('openBrowser') },
  closeBrowser: () => { ipcRenderer.send('closeBrowser') }
})

ipcRenderer.on('browserOpened', (event, payload) => browserOpened(payload))
ipcRenderer.on('browserClosed', (event, payload) => browserClosed(payload))