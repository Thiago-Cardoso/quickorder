FROM ruby:3.0.1

# DEPENDENCIAS
RUN apt-get update && \
    apt-get install -y --no-install-recommends libaio1 wget unzip curl sudo build-essential cron apt-utils && \
    apt-get install -y --no-install-recommends locales locales-all apt-utils && \
    apt-get install -y --no-install-recommends software-properties-common && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y

# IDIOMA
ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8

# NODEJS E YARN
RUN curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs yarn && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y

WORKDIR /app
COPY start.sh /app

EXPOSE 3000
CMD ["/bin/bash", "/app/start.sh"]
