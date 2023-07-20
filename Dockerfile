FROM centos:7

# update replo`s
RUN yum update -y && \
# Install utilities
    yum install curl wget nano git -y && \
    mkdir -p /etc/supervisor/conf.d && \
    mkdir -p /opt/supervisord && \
    mkdir -p /root/.ssh

WORKDIR /opt

COPY ./utilities/*.sh .
COPY ./utilities/supervisord/supervisord.conf /etc/supervisor/conf.d/
COPY ./utilities/ssh-keys/ansible-user-key /root/.ssh

# COPY ./utilities/install-ohmyzsh.sh /opt/
# COPY ./utilities/install-zsh-plugins.sh /opt/
# COPY ./utilities/install-python-3.9.sh /opt/
# COPY ./utilities/install-ansible.sh /opt/

RUN /opt/install-ohmyzsh.sh && \
    /opt/install-zsh-plugins.sh && \
    /opt/install-python-3.9.sh && \
    /opt/install-ansible.sh && \
    source /root/venv/bin/activate && \
    pip install supervisor && \
    chmod 600 /root/.ssh/ansible-user-key

ENTRYPOINT ["/root/venv/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"] 
