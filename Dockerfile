FROM armhf/alpine:3.5

# Upgrating the image first, to have the last version of all packages, and to
# share the same layer accros the images
RUN apk --no-cache upgrade \
    && apk --no-cache add \
       su-exec \
       ca-certificates \
    && rm -rf /var/cache/apk/*

# Version
ARG GHOST_VERSION=0.11.8

ENV GHOST_SOURCE /usr/src/ghost
WORKDIR $GHOST_SOURCE

RUN apk --no-cache add --virtual build-dependencies \
	gcc \
	g++ \
	make \
	python \
	unzip \
	build-base \
    wget \
	sqlite \
    && apk --no-cache add \
    nodejs \
    libressl \
    grep \
# Add for "--one-file-system" argument
    tar \
# Add for "[["
    bash \
 && wget -O ghost.zip "https://github.com/TryGhost/Ghost/releases/download/${GHOST_VERSION}/Ghost-${GHOST_VERSION}.zip" \
 && unzip ghost.zip \
 && npm install --production --loglevel=info \
 && rm ghost.zip \
 && npm cache clean \
 && apk del build-dependencies \
 && rm -rf /var/cache/apk/* /tmp/*

ENV GHOST_CONTENT /var/lib/ghost

RUN adduser -D -h /home/user -g user user

RUN mkdir -p "$GHOST_CONTENT" \
	&& chown -R user:user "$GHOST_CONTENT" \
# Ghost expects "config.js" to be in $GHOST_SOURCE, but it's more useful for
# image users to manage that as part of their $GHOST_CONTENT volume, so we
# symlink.
	&& ln -s "$GHOST_CONTENT/config.js" "$GHOST_SOURCE/config.js"

VOLUME $GHOST_CONTENT

COPY docker-entrypoint.sh /entrypoint.sh

LABEL maintainer="Julien Lavergne <julien@lavergne.online> \
      alpine_version="3.5" \
      ghost_version="${GHOST_VERSION}" \
      original_maintainer="https://github.com/docker-library/ghost" \
      original_maintainer_url="https://github.com/docker-library/ghost/blob/master/alpine/Dockerfile"

EXPOSE 2368

ENTRYPOINT ["/entrypoint.sh"]

CMD ["npm", "start"]
