ARG DOCKER_FLUENTD_TAG
FROM fluentd:${DOCKER_FLUENTD_TAG}

ENV TZ=Asia/Tokyo

USER root

RUN fluent-gem install fluent-plugin-s3 \
  && gem install uuidtools \
  && rm -rf /home/fluent/.gem/ruby/*/cache/*.gem

COPY ./fluent.conf /fluentd/etc/fluent.conf

USER fluent
