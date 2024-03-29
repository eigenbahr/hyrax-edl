.PHONY: config
SHELL = /bin/bash
.ONESHELL:
config:
	@read -p "EDL App UID      : " uid
	@read -p "EDL App Client ID: " clientid
	@read -s -p "Password      : " password
	echo
	echo
	export CLIENT_ID=$$clientid
	export ENCODED_AUTH=`echo -n $$uid:$$password | base64`
	envsubst < user-access.xml.template > user-access.xml
	echo "Configuration file `user-access.xml` has been created."

run:
	mkdir -p mydata
	docker run -d -h hyrax -p 8080:8080 --name=hyrax \
		--volume ${PWD}/user-access.xml:/usr/share/tomcat/webapps/opendap/WEB-INF/conf/user-access.xml \
		--volume ${PWD}/web.xml:/usr/share/tomcat/webapps/opendap/WEB-INF/web.xml \
		--volume ${PWD}/mydata/:/usr/share/hyrax/mydata \
		opendap/hyrax:snapshot

shell:
	docker exec -it hyrax bash

stop:
	docker stop hyrax
	docker container rm hyrax
