FROM java:8-jre
MAINTAINER Eagle Chen <chygr1234@gmail.com>

# es needs non-root user to start

RUN cd /tmp && curl -OL https://github.com/medcl/elasticsearch-rtf/archive/2.1.1.zip && \
  unzip 2.1.1.zip -d /usr/share && rm /tmp/2.1.1.zip && \
  mv /usr/share/elasticsearch-rtf-2.1.1 /usr/share/elasticsearch && \
  groupadd es && useradd -g es es && \
  for path in data config logs config/scripts; do mkdir -p "/usr/share/elasticsearch/$path"; done && \
  chown -R es:es /usr/share/elasticsearch && \
  curl -o /usr/local/bin/gosu -fsSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" && \
  chmod +x /usr/local/bin/gosu

ENV PATH /usr/share/elasticsearch/bin:$PATH

VOLUME /usr/share/elasticsearch/data

VOLUME /usr/share/elasticsearch/logs

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

CMD ["elasticsearch"]
