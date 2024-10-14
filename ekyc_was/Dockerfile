# 이미지 빌드 전 확인 : jar version

FROM centos:8

LABEL name="Byeon Minjong" \
    email="byunmj24@korea-id.co.kr" \
    description="centos8 API Server"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
ENV profile=local

ENV version=4.0.8
ENV API_VERSION=${version}
ENV MATCHING_VERSION=3.1.4


COPY ./.bashrc /root
COPY ./home /home
COPY ./ssl /ssl


RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum install -y java-1.8.0-openjdk-devel.x86_64 && \
    yum install -y vim net-tools curl libgomp cronie

# UTF-8 적용
RUN yum install -y glibc-locale-source glibc-langpack-ko
RUN localedef -f UTF-8 -i ko_KR ko_KR.UTF-8
RUN export LANG=ko_KR.UTF-8
RUN locale

# CubeOne 계정 생성
RUN useradd -g 0 cubeone


# CubeOne profile 추가
RUN echo "COHOME=/home/cubeapi; export COHOME" >> /home/cubeone/.bash_profile
RUN echo "COBINDIR=/home/cubeapi/bin; export COBINDIR" >> /home/cubeone/.bash_profile
RUN echo "COVARDIR=/home/cubeapi/var; export COVARDIR" >> /home/cubeone/.bash_profile
RUN echo "COPORT=2345;export COPORT" >> /home/cubeone/.bash_profile
RUN echo "COLOGDIR=/home/cubeapi/var/log; export COLOGDIR" >> /home/cubeone/.bash_profile
RUN echo "CODATADIR=/home/cubeapi/var/data; export CODATADIR" >> /home/cubeone/.bash_profile
RUN echo "COMSGDIR=/home/cubeapi/var/msg; export COMSGDIR" >> /home/cubeone/.bash_profile
RUN echo "COPARAMDAT=/home/cubeapi/var/data/param.dat; export COPARAMDAT" >> /home/cubeone/.bash_profile
RUN echo "COEVENTLOG=/home/cubeapi/var/log/event_log; export COEVENTLOG" >> /home/cubeone/.bash_profile

RUN echo "COMESSAGE=/home/cubeapi/var/msg/message; export COMESSAGE" >> /home/cubeone/.bash_profile
RUN echo "COSQLDIR=/home/cubeapi/var/sql; export COSQLDIR" >> /home/cubeone/.bash_profile
RUN echo "NLS_LANG=" >> /home/cubeone/.bash_profile
RUN echo "CO_HOME=/home/cubeapi;export CO_HOME" >> /home/cubeone/.bash_profile
RUN echo "DBNAME=API;export DBNAME" >> /home/cubeone/.bash_profile

RUN echo "CO_HOME=/home/cubeapi;export CO_HOME" >> ~/.bash_profile
RUN echo "DBNAME=API;export DBNAME" >> ~/.bash_profile


RUN mkdir -pv /home/matching/logs/sdk/PreMo/ && \
    mkdir -pv /home/matching/logs/sdk/KoreaID/

##############KHAN-AGENT_ADD##############
RUN mkdir -pv /usr/local/tomcat9/khan1 && \
    mkdir -pv /usr/local/tomcat9/khan2
COPY ./khan-agent /usr/local/tomcat9/khan1/.
COPY ./khan-agent /usr/local/tomcat9/khan2/.

### Env 1
ENV AGENT_OPTS_1="-javaagent:/usr/local/tomcat9/khan1/khan-agent/khan-agent-5.1.0.jar"
ENV AGENT_OPTS_1="$AGENT_OPTS_1 -Dkhan.config.file=khan-agent.conf -noverify"
ENV JAVA_OPTS_1="$JAVA_OPTS_1 $AGENT_OPTS_1"

### Env 2
ENV AGENT_OPTS_2="-javaagent:/usr/local/tomcat9/khan2/khan-agent/khan-agent-5.1.0.jar"
ENV AGENT_OPTS_2="$AGENT_OPTS_2 -Dkhan.config.file=khan-agent.conf -noverify"
ENV JAVA_OPTS_2="$JAVA_OPTS_2 $AGENT_OPTS_2"

ENV OMAPM_APPLICATION_NAME="springboot1"
ENV OMAPM_HOST="192.168.210.15"
ENV OMAPM_PORT="80"
ENV OMAPM_INSTANCE_ID="tomcat9_khan1"
#########################################

ENV PORT1=8777
ENV PORT2=9072
EXPOSE $PORT1 $PORT2

RUN chmod +x /home/was/run.sh
CMD ["/bin/bash"]
# ENTRYPOINT ["/home/was/run.sh", "/bin/bash"]