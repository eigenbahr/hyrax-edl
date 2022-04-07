.PHONY: encode
SHELL = /bin/bash
.ONESHELL:
encode:
	@read -p "EDL App UID      : " uid
	@read -p "EDL App Client ID: " clientid
	@read -s -p "Password      : " password
	echo
	echo
	export CLIENT_ID=$$clientid
	mashup=$$uid:$$password
	export ENCODED_AUTH=`echo -n $$uid:$$password | base64`
	envsubst < user-access.xml.template > user-access.xml

run:
	docker run -d -h hyrax -p 8080:8080 --name=hyrax \
		--volume ${PWD}/user-access.xml:/usr/share/tomcat/webapps/opendap/WEB-INF/conf/user-access.xml \
		--volume ${PWD}/web.xml:/usr/share/tomcat/webapps/opendap/WEB-INF/web.xml \
		--volume ${PWD}/data/:/usr/share/hyrax \
		opendap/hyrax:snapshot

shell:
	docker exec -it hyrax bash

stop:
	docker stop hyrax
	docker container rm hyrax
