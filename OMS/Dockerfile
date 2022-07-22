# This file needs to be renamed to Dockerfile

FROM centos

# General Operating System Setup
RUN cd /etc/yum.repos.d/ \
&& sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
&& sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y update
RUN yum -y install java-1.8.0-openjdk
RUN yum -y install ncurses
RUN yum -y install which
RUN yum -y install zip
RUN yum -y install bc
RUN yum -y install passwd
RUN yum -y install telnet
RUN yum -y install yum-utils
RUN yum -y install vim 
RUN yum -y install -y pam*
RUN yum -y install libnuma*
RUN yum -y install pam.i686
RUN yum -y install libaio*

RUN { echo "password"; echo "password"; } | passwd root
RUN useradd admin
RUN { echo "password"; echo "password"; } | passwd admin
RUN mkdir /home/admin/App
RUN chown admin:admin /home/admin/App

# IBM JDK Installation
RUN mkdir /home/admin/App/Utility
RUN chown admin:admin /home/admin/App/Utility
RUN mkdir /Installables
RUN cd /Installables \
&& mkdir JDK
RUN chown -R admin:admin /Installables/
COPY --chown=admin:admin ./JDK/ibm-java-sdk-8.0-7.11-x86_64-archive.bin /Installables/JDK/ibm-java-sdk-8.0-7.11-x86_64-archive.bin
RUN chmod 777 -R /Installables/JDK
USER admin
RUN cd /Installables/JDK \
&&  { echo 4; echo 1; echo ""; echo "/home/admin/App/Utility/Java"; echo "Y"; echo ""; echo ""; } | ./ibm-java-sdk-8.0-7.11-x86_64-archive.bin

# Install IBM OpenLiberty for OMS
USER root
COPY --chown=admin:admin ./Liberty/wlp.zip /home/admin/App/wlp.zip
RUN unzip /home/admin/App/wlp.zip -d /home/admin/App
RUN chown -R admin:admin /home/admin/App/wlp
RUN chmod 777 -R /home/admin/App/wlp

USER admin
RUN cd /home/admin/App/wlp/bin \
&& ./server create OMS
COPY --chown=admin:admin ./Liberty/server.xml /home/admin/App/wlp/usr/servers/OMS/server.xml
COPY --chown=admin:admin ./Liberty/jvm.options /home/admin/App/wlp/usr/servers/OMS/jvm.options
RUN rm /home/admin/App/wlp.zip

# Copy OMS Utility
USER root
COPY --chown=admin:admin ./Utility/PostgreSQLDriver /home/admin/App/Utility/PostgreSQLDriver
COPY --chown=admin:admin ./Utility/addnljars /home/admin/App/Utility/addnljars
COPY --chown=admin:admin ./Utility/mqbindings /home/admin/App/Utility/mqbindings
COPY --chown=admin:admin ./Utility/Java_Home.txt /home/admin/App/Utility/Java_Home.txt

# IBM OMS Installation
COPY --chown=admin:admin ./OMS/foundation/SMCFS_CORE_10.0.jar /Installables/OMS/foundation/SMCFS_CORE_10.0.jar
COPY --chown=admin:admin ./OMS/foundation/silent_install.txt /Installables/OMS/foundation/silent_install.txt
COPY --chown=admin:admin ./OMS/foundation/MultiSchema.xml /Installables/OMS/foundation/MultiSchema.xml
COPY --chown=admin:admin ./OMS/callcenter/ISCCS_10.0.0.jar /Installables/OMS/callcenter/ISCCS_10.0.0.jar
COPY --chown=admin:admin ./OMS/store/WSC_10.0.0.jar /Installables/OMS/store/WSC_10.0.0.jar
RUN mkdir /home/admin/manage
RUN chown admin:admin /home/admin/manage
COPY  --chown=admin:admin ./OMS/manage/* /home/admin/manage
RUN chmod 777 -R /home/admin/manage
RUN mkdir /home/admin/App/OMS \
&& chown admin:admin /home/admin/App/OMS
USER admin
