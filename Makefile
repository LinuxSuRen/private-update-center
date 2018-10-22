IMAGE_NAME=surenpi/private-update-center
CERT_KEY=suren.key
CERT_CRT=suren.crt
PLUGINS=plugins.properties
CENTER_URL=http://localhost
CENTER_PORT=1234

clean:
	rm -rf update-center2
	rm -rf www
	rm -rf plugins
	rm -rf ${PLUGINS}

build-image:
	docker build . -t ${IMAGE_NAME}

run-image:
	docker run --rm -p ${CENTER_PORT}:80 ${IMAGE_NAME}

push-image:
	docker push ${IMAGE_NAME}

update-center:
	git clone https://github.com/LinuxSuRen/update-center2
	cd update-center2 && \
	git checkout --track origin/fea/cache && \
	mvn package appassembler:assemble -DskipTests

generate-ssl:
	openssl genrsa -out rootCA/${CERT_KEY} 1024
	openssl req -new -x509 -days 1095 -key rootCA/${CERT_KEY} \
		-out rootCA/${CERT_CRT} \
		-subj "/C=CN/ST=GD/L=SZ/O=vihoo/OU=dev/CN=surenpi.com/emailAddress=suren@surenpi.com"

generate-plugins:
	go clean github.com/linuxsuren/jenkins-plugin-api-client
	go get github.com/linuxsuren/jenkins-plugin-api-client
	jenkins-plugin-api-client -names localization-zh-cn \
		-names configuration-as-code-support \
		-names alauda-devops-sync \
		-out ${PLUGINS}

generate-json:
	sh update-center2/target/appassembler/bin/app -id default -www www \
		-skip-release-history -cache plugins -whitelist ${PLUGINS} \
		-key rootCA/${CERT_KEY} -certificate rootCA/${CERT_CRT} \
		-root-certificate rootCA/${CERT_CRT} \
		-cacheServer ${CENTER_URL}:${CENTER_PORT}/plugins/ \
		-connectionCheckUrl ${CENTER_URL}:${CENTER_PORT}/