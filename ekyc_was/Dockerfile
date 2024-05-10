FROM centos:8

LABEL name="Byeon Minjong" \
    email="byunmj24@korea-id.co.kr" \
    description="centos8 API Server"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
ENV profile=local

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum install -y java-1.8.0-openjdk-devel.x86_64 && \
    yum install -y vim net-tools curl libgomp cronie

COPY ./.bashrc /root
COPY ./home /home
COPY ./ssl /ssl

EXPOSE 8777 9072

CMD ["/bin/bash"]