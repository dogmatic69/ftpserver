FROM ubuntu:16.04

RUN apt-get update 
RUN apt-get -y install vsftpd
RUN apt-get install nano 

RUN sed -i '31s/.*/write_enable=YES/' /etc/vsftpd.conf

RUN useradd -ms /bin/bash smartf
RUN echo 'smartf:ftrams' | chpasswd

RUN apt-get install -y dos2unix

ADD ["entrypoint.sh", "/entrypoint.sh"]

#change line engings and remove dos2unix
RUN dos2unix /entrypoint.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*

#make the file executable
RUN chmod +x /entrypoint.sh

#CMD ["/entrypoint.sh"]; exit 0;
ENTRYPOINT ["/entrypoint.sh"]
