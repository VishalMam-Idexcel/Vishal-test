FROM amazonlinux:latest
RUN yum update
RUN yum install python -y
RUN yum install awscli -y

RUN yum install gcc-c++ -y

RUN yum install tar -y
RUN yum install gzip -y
RUN yum install jq -y
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
RUN chmod +x /root/.nvm/nvm.sh
RUN . /root/.nvm/nvm.sh && nvm install 18.20.5
RUN yum install java-1.8.0-amazon-corretto -y
ENV PATH /root/.nvm/versions/node/v18.20.5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /los-qa-ui-automation

COPY . .

RUN chmod +x copy.sh

RUN . /root/.nvm/nvm.sh && npm install
