FROM centos:8

LABEL name="MJ" \
    email="byunmj24@korea-id.co.kr" \
    description="centos8 ADMIN Server"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
ENV profile=local

COPY ./.bashrc /root
COPY ./home /home

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \
    yum install -y vim net-tools curl libgomp && \
    chmod 755 -R /home/*
    

EXPOSE 9073

CMD ["/bin/bash"]