FROM alpine:3.6
RUN apk -v --no-cache add \
        python \
        py-pip \
        openssh \
        git \
        && \
    pip install --upgrade awsebcli
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["eb"]
