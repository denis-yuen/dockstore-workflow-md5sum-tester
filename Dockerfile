#############################################################
# Dockerfile to build a sample tool container for BAMStats
#############################################################

# Set the base image to Ubuntu
FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER Brian O'Connor <briandoconnor@gmail.com>

# Setup packages
USER root

# python3
RUN apt-get update && apt-get install --yes python3

# copy over the script
COPY bin/check_md5sum /bin/
RUN chmod a+x /bin/check_md5sum

# by default /bin/bash is executed
CMD ["/bin/bash"]
