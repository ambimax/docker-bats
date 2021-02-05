NAME            = ambimax/bats
TAG             = 1.2.1
IMG             = ${NAME}:${TAG}
LATEST          = ${NAME}:latest
BATS_CORE_IMAGE = bats/bats:${TAG}

build:
	docker build --build-arg BATS_CORE_IMAGE=${BATS_CORE_IMAGE} -t "${IMG}" .

push:
	@docker tag "${IMG}" ${LATEST}
	@docker push ${NAME}

enter:
	docker run -it --entrypoint bash --rm --volume "${PWD}/workspace:/workspace" "${IMG}"

test:
	docker run --rm --volume "${PWD}/workspace:/workspace" "${IMG}" -r /workspace/tests/
