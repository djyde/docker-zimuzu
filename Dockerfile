FROM centos:7

LABEL maintainer="Randy<randypriv@gmail.com>" \
  version="1.0.0"

ENV PORT=3001

RUN mkdir -p /data
RUN mkdir -p /rrshareweb

RUN curl http://appdown.rrys.tv/rrshareweb_linux_2.20.tar.gz -o rrshareweb_linux_2.20.tar.gz && tar -xzvf rrshareweb_linux_2.20.tar.gz -C /rrshareweb

RUN echo " \
{ \
    \"port\" : ${PORT}, \
    \"logpath\" : \"\", \
    \"logqueit\" : false, \
    \"loglevel\" : 1, \
    \"logpersistday\" : 2, \
    \"defaultsavepath\" : \"/data\" \
}" > /rrshareweb/rrshareweb/conf/rrshare.json

RUN cat /rrshareweb/rrshareweb/conf/rrshare.json

VOLUME [ "/data" ]

CMD [ "/rrshareweb/rrshareweb/rrshareweb" ]
