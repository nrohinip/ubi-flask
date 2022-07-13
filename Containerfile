FROM registry.access.redhat.com/ubi8/ubi:latest
RUN mkdir /opt/hello
WORKDIR /opt/hello
COPY hello/* /opt/hello
RUN dnf -y install python3-pip
RUN dnf clean all
RUN pip3 install -r /opt/hello/requirements.txt
RUN rm -rf /root/.cache
EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "hello:app"]
