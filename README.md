# EB CLI in Docker

Containerized Elastic Beanstalk Command Line Interface on alpine to avoid
requiring the awsebcli to be installed on CI machines.

Based on [mesosphere/aws-cli](https://hub.docker.com/r/mesosphere/aws-cli/) image.

## Build

```
docker build -t paulodiovani/aws-eb-cli .
```

Automated build on Docker Hub

[![DockerHub Badge](http://dockeri.co/image/paulodiovani/aws-eb-cli)](https://hub.docker.com/r/paulodiovani/aws-eb-cli/)

## Usage

Configure:

```
export AWS_ACCESS_KEY_ID="<id>"
export AWS_SECRET_ACCESS_KEY="<key>"
export AWS_DEFAULT_REGION="<region>"
```

Init application in local folder:

```
./eb.sh init
```

## Install

To use `eb.sh` as a drop-in replacement for calls to the aws-eb-cli, use one of the following methods:

Add an alias to your shell:

```
alias eb='docker run --rm -t $(tty &>/dev/null && echo "-i") -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/project" -v "${HOME}/.ssh:/root/.ssh" paulodiovani/aws-eb-cli'
```

Or drop it into your path named `aws`:

```
curl -o /usr/local/bin/eb https://raw.githubusercontent.com/paulodiovani/aws-eb-cli/master/eb.sh && chmod a+x /usr/local/bin/eb
```

## References

EB CLI Docs: http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3.html
