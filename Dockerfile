FROM java:8-jre
MAINTAINER Eagle Chen <chygr1234@gmail.com>

RUN cd /tmp && curl -OL https://github.com/medcl/elasticsearch-rtf/archive/1.6.0.zip && \
  unzip 1.6.0.zip -d /usr/share && rm /tmp/1.6.0.zip && \
  mv /usr/share/elasticsearch-rtf-1.6.0 /usr/share/elasticsearch

ENV PATH /usr/share/elasticsearch/bin:$PATH

VOLUME ["/usr/share/elasticsearch/data", "/usr/share/elasticsearch/logs"]

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

CMD ["elasticsearch"]
