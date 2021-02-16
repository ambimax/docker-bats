NAME            = ambimax/bats
TAG             = 1.2.2
IMG             = ${NAME}:${TAG}
LATEST          = ${NAME}:latest

build:
	docker image build --compress --tag "${IMG}" .

push:
	@docker image tag "${IMG}" ${LATEST}
	@docker image push --all-tags ${NAME}

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
