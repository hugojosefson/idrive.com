FROM ubuntu:22.04
#FROM debian:11-slim

COPY install-idrive /usr/local/bin/
RUN ["install-idrive"]
CMD ["/bin/bash"]
