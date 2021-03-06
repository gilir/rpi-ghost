FROM alpine:3.8

# Upgrating the image first, to have the last version of all packages, and to
# share the same layer accros the images
RUN apk --no-cache upgrade \
    && apk --no-cache add \
       su-exec \
       ca-certificates

ARG VERSION=2.2.3

ENV GHOST_NODE_VERSION_CHECK=false \
    NODE_ENV=production \
    GID=991 UID=991 \
    ADDRESS=https://blog.lavergne.online \
    ENABLE_ISSO=False \
    ISSO_HOST=isso.lavergne.online \
    ISSO_AVATAR=false \
    ISSO_VOTE=false \
    ENABLE_DISQUS=False \
    DISQUS_SHORTNAME=shortname

WORKDIR /ghost

RUN apk -U --no-cache add \
    bash \
    ca-certificates \
    grep \
    libressl \
    nodejs \
    nodejs-npm \
    s6 \
    su-exec \
    vim \
    build-base \
    gcc \
    g++ \
    make \
    sqlite \
    python \
    nodejs-current-dev \
 && wget -q https://github.com/TryGhost/Ghost/releases/download/${VERSION}/Ghost-${VERSION}.zip -P /tmp \
 && unzip -q /tmp/Ghost-${VERSION}.zip -d /ghost \
 && npm install --production \
 && mv content/themes/casper casper

COPY rootfs /

RUN chmod +x /usr/local/bin/* /etc/s6.d/*/* /etc/s6.d/.s6-svscan/*

EXPOSE 2368

VOLUME /ghost/content

LABEL description="Ghost CMS ${VERSION}" \
      maintainer="Wonderfall <wonderfall@targaryen.house>"

ENTRYPOINT ["run.sh"]
CMD ["/bin/s6-svscan", "/etc/s6.d"]
