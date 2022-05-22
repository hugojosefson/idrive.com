FROM ubuntu:22.04
COPY install-idrive /usr/local/bin/
RUN ["install-idrive"]
CMD ["/bin/bash"]
