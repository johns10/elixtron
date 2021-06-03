# Elixtron

This is a sample Phoenix LiveView project that illustrates how to get up and running with a Chrome Extension, Electron Application, and a local Bakeware binary that accepts calls over a custom protocol.  See the companion app (the bakeware binary) here: https://github.com/johns10/elixtron_desktop.

Before getting started, you should set up a CA and trust the CA on your local machine. Extensions and Electron are not forgiving about security, and this is the only way I've found to make development go smoothly. I've included certs, and a bash script for generating new ones if you prefer that: https://github.com/johns10/elixtron/tree/master/priv/cert

To use the chrome extension, I recommend moving the files in https://github.com/johns10/elixtron/tree/master/assets/js/extension to /priv/static/js for development. They just need to be in the same directory with the app.js file.  I move them there for convenience, so when weback rebuilds, the extension is using those files. Once you've moved the files over, you can load the unpacked version of the extension (https://webkul.com/blog/how-to-install-the-unpacked-extension-in-chrome/).

You should also add the hostname you selected for your certs (or dev.elixtron.com).  If you want to use a different host name, change it in https://github.com/johns10/elixtron/blob/master/assets/js/electron/index.js.  Go to assets/js/electron and give it a `yarn install && yarn run start` to start the electron application.

To use the companion application, you will need to set up a custom protocol that calls the batch file/bash script mentioned in the readme.

I used these instructions because I'm on Windows: https://support.shotgunsoftware.com/hc/en-us/articles/219031308-Launching-applications-using-custom-browser-protocols

I haven't test these, but here's some linux instructions: https://support.shotgunsoftware.com/hc/en-us/articles/219031308-Launching-applications-using-custom-browser-protocols

## Props

This project was generated using the FullstackPhoenix boilerplate generator: https://fullstackphoenix.com/boilerplates

Much love to the bakeware folks for their great library: https://github.com/bake-bake-bake/bakeware
