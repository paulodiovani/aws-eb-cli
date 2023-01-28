FROM alpine:latest
RUN apk -v --no-cache add \
        git \
        less \
        openssh-client \
        py3-pip \
        python3 \
        && \
    pip3 install --upgrade awsebcli --ignore-installed six
RUN git config --global --add safe.directory /project
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["eb"]
