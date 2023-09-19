FROM openeuler/openeuler:20.03-lts

# 1
COPY files/ /tmp/files/

# 2
USER root
WORKDIR /root
ENV USER=root
ENV HOME=/root
RUN /tmp/files/install.sh

# 3
RUN rm -rf /tmp/files/
