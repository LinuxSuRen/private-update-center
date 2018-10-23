# Private Update Center

Jenkins offical update center has lots of plugins. It will take more time when you check update. This project offer you a solution that allow you pick some of those
plugins. And you could deploy the update center to wherever you want.

# Steps

1. Create your own certificate. You can just execute `make generate-ssl`.
2. Fetch plugins information then generate update.json. `make generate-plugins && make update-center && make generate-json`
3. Build then run a docker image. `make build-image && make run-image`
4. Start your Jenkins server then copy your-certificate.crt into `$JENKINS_HOME/war/WEB-INF/update-center-rootCAs/`.
5. Change the update center url in `http://localhost:8080/pluginManager/advanced`.

Finally, you could see your favour plugins.

# Sources

Jenkins update center generator source code is [here](https://github.com/linuxsuren/update-center2/tree/fea/cache).

# Kubernetes

If you wish use this update center in your kubernetes environment, please take a look our [charts](https://github.com/linuxsuren/private-update-center-charts).