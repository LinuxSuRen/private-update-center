# Private Update Center

Jenkins offical update center has lots of plugins. It will take more time when you check update. This project offer you a solution that allow you pick some of those
plugins. And you could deploy the update center to wherever you want.

# Steps

1. Create your own certificate. You can just execute `generate-ssl.sh`.
2. Fetch plugins information then generate update.json.
3. Build a docker image.
4. Copy your-certificate.crt into `~/.jenkins/war/WEB-INF/update-center-rootCAs`.
5. Change the update center url in `http://localhost:8080/pluginManager/advanced`.

Finally, you could see your faver plugins.