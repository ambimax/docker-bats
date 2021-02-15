ARG ALPINE_IMAGE=alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321

###############################################################################
# BUILD STAGE
###############################################################################
FROM ${ALPINE_IMAGE} AS builder

ARG BATS_CORE_VERSION=1.2.1
ARG BATS_SUPPORT_VERSION=0.3.0
ARG BATS_ASSERT_VERSION=2.0.0
ARG BATS_FILE_VERSION=0.3.0

RUN apk --no-cache add curl

WORKDIR /tmp
SHELL ["/bin/ash", "-euxo", "pipefail", "-c"]
RUN curl -fsSL https://github.com/bats-core/bats-core/archive/v${BATS_CORE_VERSION}.tar.gz | tar xzv; \
    curl -fsSL https://github.com/bats-core/bats-support/archive/v${BATS_SUPPORT_VERSION}.tar.gz | tar xzv; \
    curl -fsSL https://github.com/bats-core/bats-assert/archive/v${BATS_ASSERT_VERSION}.tar.gz | tar xzv; \
    curl -fsSL https://github.com/bats-core/bats-file/archive/v${BATS_FILE_VERSION}.tar.gz | tar xzv


###############################################################################
# FINAL IMAGE
###############################################################################
FROM ${ALPINE_IMAGE}

ARG BASH_VERSION=5.0.17-r0
ARG PARALLEL_VERSION=20200522-r0
ARG NCURSES_VERSION=6.2_p20200523-r0
ARG APK_PACKAGES="make docker docker-compose"

RUN set -eu; \
    apk --no-cache add bash=${BASH_VERSION} parallel=${PARALLEL_VERSION} ncurses=${NCURSES_VERSION} ${APK_PACKAGES}; \
    mkdir -p ~/.parallel /workspace; \
    touch ~/.parallel/will-cite

COPY --from=builder /tmp/bats-core-* /opt/bats-core
COPY --from=builder /tmp/bats-support-* /opt/bats/lib/bats-support
COPY --from=builder /tmp/bats-assert-* /opt/bats/lib/bats-assert
COPY --from=builder /tmp/bats-file-* /opt/bats/lib/bats-file
COPY helper.bash /opt/bats/lib/helper.bash

RUN ln -s /opt/bats-core/bin/bats /usr/local/bin/bats

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/bats"]
CMD ["--help"]
