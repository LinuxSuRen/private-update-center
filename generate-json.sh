#!/bin/sh

# go get github.com/linuxsuren/jenkins-plugin-api-client

# jenkins-plugin-api-client -name localization-zh-cn -out plugins.properties

sh appassembler/bin/app -id default -www www \
    -skip-release-history -cache plugins -whitelist plugins.properties \
    -key rootCA/suren.key -certificate rootCA/suren.crt \
    -root-certificate rootCA/suren.crt \
    -cacheServer http://localhost:1234/plugins/ \
    -connectionCheckUrl http://localhost:1234/