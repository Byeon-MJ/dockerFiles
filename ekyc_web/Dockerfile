FROM tomcat:9

LABEL name="Byeon Minjong" \
    email="byunmj24@korea-id.co.kr" \
    description="Web PROD Server"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
ENV VERSION=ekyc_web_3.9.3

RUN apt-get update -y
RUN apt-get install -y libgomp1 vim wget

COPY ./home /home
COPY ./ssl /ssl
COPY ./server.xml /usr/local/tomcat/conf
COPY ./catalina.sh /usr/local/tomcat/bin
COPY ./Catalina /usr/local/tomcat/conf/Catalina

# ##############KHAN-AGENT_ADD##############
# RUN mkdir -pv /usr/local/tomcat/khan
# COPY ./khan-agent /usr/local/tomcat/khan
# ENV AGENT_OPTS="-javaagent:/usr/local/tomcat/khan/khan-agent/khan-agent-5.1.0.jar"
# ENV AGENT_OPTS="$AGENT_OPTS -Dkhan.config.file=khan-agent.conf"
# ENV AGENT_OPTS="$AGENT_OPTS -noverify"
# ENV JAVA_OPTS="$JAVA_OPTS $AGENT_OPTS"
# #########################################

WORKDIR /usr/local/tomcat

EXPOSE 8080 9071

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]