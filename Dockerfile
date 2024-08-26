FROM freeradius/freeradius-server:latest
RUN apt-get update && apt-get install vim freeradius-utils freeradius-mysql libmysqlclient*
RUN cd /etc/raddb/mods-enabled && \
    ln -s ../mods-available/sql
RUN sed -i 's|instantiate {|instantiate {\nsql|' /etc/raddb/radiusd.conf