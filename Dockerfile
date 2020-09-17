FROM tensorflow/tensorflow:latest-gpu-jupyter

RUN apt-get update && apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
        screen && \
        rm -rf /var/lib/apt/lists/*

# install python & pytorch
RUN pip install pip -U && \
	pip config set global.index-url https://pypi.douban.com/simple/ && \
    pip install scipy matplotlib jupyter jupyterlab \
                ipython scikit-learn pandas 
                


## import rsa_pub from file
# RUN mkdir -p /var/run/sshd && mkdir -p /root/.ssh && \
#     sed -ri "s/session required pam_loginuid.so/#session required pam_loginuid.so/g" /etc/pam.d/sshd
# COPY ./authorized_keys /root/.ssh/authorized_keys

RUN echo "#! /bin/bash" > /run.sh && chmod 755 /run.sh && mkdir -p /workspace

EXPOSE 22

WORKDIR /workspace
RUN chmod -R a+w .


