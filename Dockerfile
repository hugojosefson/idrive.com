FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y apt-utils && apt-get full-upgrade --purge --auto-remove -y
RUN apt-get install -y unzip

WORKDIR /root
ADD https://www.idrivedownloads.com/downloads/linux/download-for-linux/LinuxScripts/IDriveForLinux.zip IDriveForLinux.zip
RUN unzip *.zip
RUN chmod +x */scripts/*.pl

RUN apt-get install -y bash less vim perl curl wget
RUN apt-get install -y build-essential sqlite3 perl-doc libdbi-perl libdbd-sqlite3-perl
RUN apt-get install -y libterm-readline-gnu-perl
WORKDIR /opt/idrive
RUN mv /root/IDriveForLinux/scripts /opt/idrive/
RUN ls -laF /root/IDriveForLinux/
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/idrive/scripts
ENV TERM vt100
COPY answers.txt .
#RUN account_setting.pl --auto-setup < answers.txt
CMD ["/bin/bash"]
