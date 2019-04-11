FROM centos:7

LABEL maintainer="Randy<randypriv@gmail.com>" \
  version="0.0.1"

ENV PORT=3001

RUN mkdir -p /data
RUN mkdir -p /rrshareweb

RUN curl https://appdown.rrysapp.com/rrshareweb_centos7.tar.gz -o rrshareweb_centos7.tar.gz && tar -xzvf rrshareweb_centos7.tar.gz -C /rrshareweb

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
