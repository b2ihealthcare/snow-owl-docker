FROM centos:7
LABEL maintainer="B2i Healthcare <http://b2i.sg/>"

ARG SNOWOWL_RPM_PACKAGE

# Install java-11-openjdk as a pre requirement
RUN yum -y update -q -e 0 && yum clean all
RUN yum install -y \
       java-11-openjdk \
       java-11-openjdk-devel -q -e 0

# Set JAVA_HOME environment variable
ENV JAVA_HOME /etc/alternatives/jre_11_openjdk

# Install Snow Owl rpm package
WORKDIR /usr/share
COPY ${SNOWOWL_RPM_PACKAGE} ${SNOWOWL_RPM_PACKAGE}
RUN rpm --install ${SNOWOWL_RPM_PACKAGE}
RUN rm -f ${SNOWOWL_RPM_PACKAGE}

# Openshift overrides USER and uses ones with randomly uid>1024 and gid=0
RUN chgrp 0 /usr/share/snowowl/bin/snowowl.sh && \
    chmod g=u /etc/passwd && \
    chmod 0775 /usr/share/snowowl/bin/snowowl.sh

# Overwrite config file after installation
COPY /config/snowowl.yml /etc/snowowl/snowowl.yml

# Set environment variable for Snow Owl data folder
ENV SO_PATH_DATA /var/lib/snowowl:$SO_PATH_DATA

# Expose necessary ports used by Snow OWl
EXPOSE 2036 8080

USER snowowl

ENTRYPOINT ["/usr/share/snowowl/bin/snowowl.sh"]
