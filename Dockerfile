FROM postgres:14
LABEL postgres.description="postgres:14"

RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8

WORKDIR /var/lib/postgresql/data
