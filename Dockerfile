FROM images
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
RUN npm install -g hubot coffee-script

RUN git config --global user.name "BenderBot"
RUN git config --global user.email ""

RUN apt-get install ca-certificates

RUN git clone https://github /root/bender
WORKDIR /root/bender 

RUN npm install hubot-hipchat --save 
RUN npm install hubot-pagerduty-github --save
RUN npm install hubot-shipit --save
RUN npm install hubot-pugme --save
RUN npm install hubot-victory --save
RUN npm install hubot-jenkins --save
RUN npm install hubot-thesimpsons --save
RUN npm install hubot-calculator --save
RUN npm install hubot-jenkins-notifier --save
RUN npm install htmlparser --save


RUN npm install 
RUN chmod 755 bin/hubot
RUN chmod +x /root/bender/bender.sh
CMD ["/root/bender/bender.sh"]
