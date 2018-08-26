FROM postgres:10.5
LABEL e-postgres.description="postgres:10.5"
LABEL e-postgres.version="0.1.2"

RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8



