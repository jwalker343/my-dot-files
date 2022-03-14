// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Google Chrome",
  rewrite: [
    {
      match: ({ url }) => url.host === ("app.clickup.com"),
      url: { protocol: "clickup" }
    }
  ],
  handlers: [
    {
      match: /^https?:\/\/psa\.spinen\.net\/.*$/,
      browser: "ConnectWise"
    },
    {
      match: /^https?:\/\/auth\.spinen\.net$/,
      browser: "Secret Server"
    },
    {
      match: /^https?:\/\/remote\.spinen\.net$/,
      browser: "n-able"
    },
    {
      match: ({ url }) => url.protocol === "clickup",
      // browser: "Google Chrome"
      browser: {
        name: "/Applications/ClickUp.app",
        appType: "appPath", // Force name type. "appName", "bundleId" or "appPath",
        openInBackground: false // or false, force opening the browser in the background
      }
    }
  ]
}
