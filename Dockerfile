FROM images.quadra.opendns.com/opendns/trusty
ENV DEBIAN_FRONTEND noninteractive
## install required packages
## 092614
RUN apt-get update
RUN apt-get install -yf \
    build-essential\
    libssl-dev\
    redis-server\
    git\
    iputils-ping\
    libexpat1-dev\
    libicu-dev\
    nodejs\
    npm 

WORKDIR /root 

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g hubot coffee-script yo generator-hubot

COPY hubot-scripts.json /root/hubot-scripts.json
COPY external-scripts.json /root/external-scripts.json
COPY package.json /root/package.json

#WORKDIR /root/bender

RUN npm install -g hubot-hipchat  
RUN npm install -g hubot-pagerduty-github 
RUN npm install -g hubot-shipit 
RUN npm install -g hubot-pugme 
RUN npm install -g hubot-victory 
RUN npm install -g hubot-jenkins 
RUN npm install -g hubot-thesimpsons 
RUN npm install -g hubot-calculator 
RUN npm install -g hubot-jenkins-notifier 
RUN npm install -g htmlparser 
RUN npm install -g hubot-trello

COPY bender.sh /root/bender.sh
COPY build.sh /root/build.sh

RUN npm install 
#RUN yo hubot --owner "eng.systems-team@opendns.com" --name "Bender" --adapter hipchat --home "/root" 
RUN chmod +x /root/bender.sh
CMD ["/root/bender.sh"]
ADD bin /root/bin
ADD scripts /root/scripts   
