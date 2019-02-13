FROM golang

# Install beego and the bee dev tool
WORKDIR /go/src

RUN git clone https://github.com/astaxie/beego.git
WORKDIR beego
RUN go install
RUN git clone https://github.com/beego/bee.git
WORKDIR bee
RUN go install

# Expose the application on port 8080
EXPOSE 8080

# Set the entry point of the container to the bee command that runs the
# application and watches for changes
CMD ["bee", "run"]
