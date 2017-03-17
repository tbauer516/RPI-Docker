FROM debian:jessie

# Install basic required packages.
RUN echo deb https://downloads.plex.tv/repo/deb/ public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list \
 && curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add - \
 && apt-get update \
 && apt-get install \
        ca-certificates \
        curl \
        xmlstarlet \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN set -x \
    # Create plex user
 && useradd --system --uid 797 -M --shell /usr/sbin/nologin plex \
    # Download and install Plex (non plexpass) after displaying downloaded URL in the log.
    # This gets the latest non-plexpass version
    # Note: We created a dummy /bin/start to avoid install to fail due to upstart not being installed.
    # We won't use upstart anyway.
 && curl -I 'https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu' \
 && curl -L 'https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu' -o plexmediaserver.deb \
 && touch /bin/start \
 && chmod +x /bin/start \
 && dpkg -i plexmediaserver.deb \
 && rm -f plexmediaserver.deb \
 && rm -f /bin/start \
 && mkdir /config \
 && chown plex:plex /config

# PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS: The number of plugins that can run at the same time.
# $PLEX_MEDIA_SERVER_MAX_STACK_SIZE: Used for "ulimit -s $PLEX_MEDIA_SERVER_MAX_STACK_SIZE".
# PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR: defines the location of the configuration directory,
# default is "${HOME}/Library/Application Support".
ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6 \
    PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000 \
    PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/config \
    PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver \
    LD_LIBRARY_PATH=/usr/lib/plexmediaserver \
    TMPDIR=/tmp

COPY root /

VOLUME ["/config", "/media"]

EXPOSE 32400

USER plex

WORKDIR /usr/lib/plexmediaserver

CMD ["/usr/lib/plexmediaserver/Plex Media Server"]
