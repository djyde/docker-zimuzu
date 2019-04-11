FROM centos:7

LABEL maintainer="Randy<randypriv@gmail.com>" \
  version="0.0.1"

ENV PORT=3001

RUN mkdir -p /data

# ADD rrshareweb /app/

RUN wget https://appdown.rrysapp.com/rrshareweb_centos7.tar.gz && tar -xzvf rrshareweb_centos7.tar.gz -C /app

RUN echo " \
{ \
    \"port\" : ${PORT}, \
    \"logpath\" : \"\", \
    \"logqueit\" : false, \
    \"loglevel\" : 1, \
    \"logpersistday\" : 2, \
    \"defaultsavepath\" : \"/data\" \
}" >> /app/rrshareweb/conf/rrshare.json

VOLUME [ "/data" ]

CMD [ "/app/rrshareweb/rrshareweb" ]
