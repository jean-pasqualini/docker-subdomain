add:
	touch services.env
	echo "127.0.0.1 ${branch}.local" >> /etc/hosts
	docker run --rm --expose=80 --name=${branch} -v ${CURDIR}/src/${branch}:/app -w /app -d -e VIRTUAL_HOST=${branch}.local:80 php:7.0-cli php -S 0.0.0.0:80
	./bind-haproxy.sh
remove:
	docker stop testA
	docker stop testB
	./bind-haproxy.sh
pkpas:
	@echo ${PWD}/src/${branch}:/app
recreate:
	docker-compose -f docker-compose.yml up -d --force-recreate haproxy
update:
	./update.sh
	cat services.env
info:
	@echo ${CURDIR}
