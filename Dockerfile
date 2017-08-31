FROM alpine:3.6
RUN apk -v --update --no-cache add \
        python \
        py-pip \
        openssh \
        git \
        && \
    pip install --upgrade awsebcli && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["eb"]
