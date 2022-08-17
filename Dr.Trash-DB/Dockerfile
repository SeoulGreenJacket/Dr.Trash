FROM  postgres:14-alpine

RUN apk add --no-cache supervisor
RUN echo '0 0 * * * run-parts /etc/cron.daily' > /etc/crontabs/root
COPY ./cron.daily /etc/cron.daily

RUN mkdir /etc/supervisor.d
COPY postgres_cron.ini /etc/supervisor.d/postgres_cron.ini
COPY ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]
