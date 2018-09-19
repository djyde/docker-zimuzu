FROM centos:7

LABEL maintainer="Randy<randypriv@gmail.com>" \
  version="0.0.1"

ENV PORT=3001

RUN mkdir -p /data

ADD rrshareweb /app/

RUN echo " \
{ \
    \"port\" : ${PORT}, \
    \"logpath\" : \"\", \
    \"logqueit\" : false, \
    \"loglevel\" : 1, \
    \"logpersistday\" : 2, \
    \"defaultsavepath\" : \"/data\" \
}" >> /app/conf/rrshare.json

VOLUME [ "/data" ]

CMD [ "/app/rrshareweb" ]