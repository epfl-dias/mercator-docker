################################################################################
#
#                    Copyright (c) 2020-2020
#   Data Intensive Applications and Systems Labaratory (DIAS)
#            Ecole Polytechnique Federale de Lausanne
#
#                      All Rights Reserved.
#
# Permission to use, copy, modify and distribute this software and its
# documentation is hereby granted, provided that both the copyright notice
# and this permission notice appear in all copies of the software, derivative
# works or modified versions, and any portions thereof, and that both notices
# appear in supporting documentation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. THE AUTHORS AND ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE
# DISCLAIM ANY LIABILITY OF ANY KIND FOR ANY DAMAGES WHATSOEVER RESULTING FROM 
# THE USE OF THIS SOFTWARE.
#
################################################################################
FROM scratch

MAINTAINER Lionel Sambuc <lionel.sambuc@epfl.ch>

ENV LANG=C.UTF-8

COPY mercator/target/x86_64-unknown-linux-musl/release/mercator_service /
COPY mercator/mercator_service/static ./static

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="kg-spatial-search" \
    org.label-schema.description="Docker image for running the KnowledgeGraph Spatial Search service" \
    org.label-schema.url="https://github.com/HumanBrainProject/mercator" \
    org.label-schema.vcs-type="git" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/HumanBrainProject/mercator" \
    org.label-schema.vendor="DIAS EPFL" \
    org.label-schema.version=$VERSION \
    org.label-schema.docker.dockerfile="Dockerfile" \
    org.label-schema.schema-version="1.0"

CMD ["/mercator_service"]
