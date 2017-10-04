FROM resin/armv7hf-debian
MAINTAINER Eloco <elogicocal@gmail.com>
RUN apt-get update
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN apt-get install nano wget
RUN mkdir /home/git
RUN useradd git
RUN chown -R git /home/git
#RUN apt-get install golang-go

#USER git
#RUN /bin/bash \
#    && cd ~ \
#    && mkdir local 

#WORKDIR /home/git
#COPY go1.6.linux-armv6l.tar.gz /home/git/go1.6.linux-armv6l.tar.gz
#RUN tar -C /home/git/local -xzf /home/git/go1.6.linux-armv6l.tar.gz


#RUN echo 'export GOROOT=$HOME/local/go' >> $HOME/.bashrc \
#    && echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc \
#    && echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc 
#ENTRYPOINT ["/bin/bash", "source $HOME/.bashrc","go get -u github.com/gogits/gogs","cd $GOPATH/src/github.com/gogits/gogs","go build"]


CMD ["/usr/bin/supervisord"]
