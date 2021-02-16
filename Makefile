NAME            = ambimax/bats
TAG             = 1.2.2
IMG             = ${NAME}:${TAG}
LATEST          = ${NAME}:latest

build:
	docker build --tag "${IMG}" .

push:
	@docker tag "${IMG}" ${LATEST}
	@docker push ${NAME}:${TAG}
	@docker push ${NAME}:${LATEST}

enter:
	@docker run --rm \
		--interactive \
		--entrypoint bash \
		--volume "${PWD}/workspace:/workspace" \
		--volume "/var/run/docker.sock:/var/run/docker.sock" \
		--env DOCKER_HOST="unix:///docker.sock" \
		"${IMG}"

test:
	@docker run --tty --rm \
		--volume "${PWD}/workspace:/workspace" \
		--volume "/var/run/docker.sock:/var/run/docker.sock" \
		"${IMG}" -r /workspace/tests/
