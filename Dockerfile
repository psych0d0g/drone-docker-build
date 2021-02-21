ARG DOCKER_VER=v0.3.8

FROM jess/img:${DOCKER_VER}

ARG VCS_REF
ARG DOCKER_VER

LABEL maintainer="Psych0d0g <h@xx0r.eu>" \
      org.label-schema.vendor="Psych0d0g" \
      org.label-schema.name="img-build" \
      org.label-schema.description="A Drone CI plugin for building and labelling Docker images" \
      org.label-schema.version=${VCS_REF} \
      io.spritsail.version.docker=${DOCKER_VER}

ADD *.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh && \
    apk --no-cache add \
        git

ENTRYPOINT [ "/usr/local/bin/build.sh" ]
