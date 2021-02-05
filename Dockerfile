ARG BATS_CORE_IMAGE=bats/bats:latest




FROM alpine as helper

RUN apk --no-cache add curl tar \
    && mkdir -p /opt

# Install bats assert
RUN curl -L >bats-assert.tar.gz https://github.com/bats-core/bats-assert/archive/v2.0.0.tar.gz \
 && tar -xzvf bats-assert.tar.gz -C /opt \
 && rm bats-assert.tar.gz

# Install bats file
RUN curl -L >bats-file.tar.gz https://github.com/bats-core/bats-file/archive/v0.3.0.tar.gz \
 && tar -xzvf bats-file.tar.gz -C /opt \
 && rm bats-file.tar.gz





FROM ${BATS_CORE_IMAGE}

WORKDIR /workspace

COPY --from=helper /opt/bats-assert-2.0.0 /opt/bats/lib/bats-assert
COPY --from=helper /opt/bats-file-0.3.0 /opt/bats/lib/bats-file
COPY helper.bash /opt/bats/lib/helper.bash
