FROM ubuntu:16.04

RUN apt-get update && \
  apt-get -y install vsftpd dos2unix && \
  sed -i '31s/.*/write_enable=YES/' /etc/vsftpd.conf && \
  useradd -ms /bin/bash smartf && \
  echo 'smartf:ftrams' | chpasswd

COPY ./entrypoint.sh /entrypoint.sh

RUN dos2unix /entrypoint.sh && \
  apt-get --purge remove -y dos2unix && \
  rm -rf /var/lib/apt/lists/* && \
  chmod +x /entrypoint.sh
  
ENTRYPOINT ["/entrypoint.sh"]
