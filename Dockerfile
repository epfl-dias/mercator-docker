# Instructions adapted from:
#  https://alexbrand.dev/post/how-to-package-rust-applications-into-minimal-docker-containers/
#

FROM clux/muslrust:stable AS build

ARG PROJECT=mercator

# Retrieve sources
COPY ${PROJECT} /volume/${PROJECT}

# Build the service
WORKDIR /volume/${PROJECT}
RUN cargo build --release

# Copy the statically-linked binary into a scratch container.
FROM alpine:latest

# Environment variables are resetted by the FROM clause.
ARG PROJECT=mercator
ARG BIN=mercator_service
ENV BIN=${BIN}

# The day we need openssl
# RUN apk --no-cache add ca-certificates

COPY --from=build /volume/${PROJECT}/target/x86_64-unknown-linux-musl/release/${BIN} /bin/${BIN}
COPY --from=build /volume/${PROJECT}/mercator_service/static /bin/static

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="kg-spatial-search" \
    org.label-schema.description="Docker image for running the KnowledgeGraph Spatial Search service" \
    org.label-schema.url="https://github.com/HumanBrainProject/mercator" \
    org.label-schema.vcs-type="git" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/HumanBrainProject/mercator" \
    org.label-schema.vendor="DIAS EPFL" \
    org.label-schema.docker.dockerfile="Dockerfile" \
    org.label-schema.schema-version="1.0"

CMD "/bin/${BIN}"
