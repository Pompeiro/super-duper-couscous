FROM eclipse-temurin:17 

RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.40.5/yq_linux_amd64
RUN chmod a+x /usr/local/bin/yq
RUN yq --version

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    bash \
    git \
    vim \
    maven \
    gradle \
    cucumber \
    iptables

RUN apt-get install -y build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Install pyenv
RUN set -ex \
    && curl https://pyenv.run | bash \
    && pyenv update \
    && pyenv install 3.10 \
    && pyenv global 3.10 \
    && pyenv rehash
