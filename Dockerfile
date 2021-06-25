FROM postgres:10.17-alpine@sha256:0eef1c94e0c4b0c4b84437785d0c5926f62b7f537627d97cf9ebcd7b205bc9aa

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache py2-pip && pip install awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY backup.sh /usr/local/bin/backup
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD /usr/local/bin/entrypoint
