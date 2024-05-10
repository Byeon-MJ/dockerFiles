FROM tomcat:9

LABEL name="Byeon Minjong" \
    email="byunmj24@korea-id.co.kr" \
    description="Web PROD Server"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

RUN apt-get update && \
    apt-get install -y libgomp1

COPY ./home /home
COPY ./ssl /ssl
COPY ./server.xml /usr/local/tomcat/conf
COPY ./Catalina /usr/local/tomcat/conf/Catalina

EXPOSE 8080 9071

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]