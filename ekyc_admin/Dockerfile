FROM centos:8

LABEL name="MJ" \
    email="byunmj24@korea-id.co.kr" \
    description="centos8 ADMIN Server"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
ENV profile=local

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum install -y vim net-tools curl libgomp && \
    chmod 755 -R /home/*
    
# UTF-8 적용
RUN yum install -y glibc-locale-source glibc-langpack-ko
RUN localedef -f UTF-8 -i ko_KR ko_KR.UTF-8
RUN export LANG=ko_KR.UTF-8
RUN locale

# CubeOne 계정 생성
RUN useradd -g 0 cubeone

COPY ./.bashrc /root
COPY ./home /home
COPY ./ssl /ssl

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum install -y vim net-tools curl libgomp && \
    chmod 755 -R /home/*


EXPOSE 9073

CMD ["/bin/bash"]