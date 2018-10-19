#!/bin/sh

# go get github.com/linuxsuren/jenkins-plugin-api-client

# jenkins-plugin-api-client -name localization-zh-cn -out plugins.properties

sh appassembler/bin/app -id private-jenkins -www www -skip-release-history -cache plugins -whitelist plugins.properties -cacheServer http://localhost:1234/plugins/