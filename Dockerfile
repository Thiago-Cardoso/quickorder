FROM ruby:3.0.1

## ----------------------------------------------------
## TimeZone
## ----------------------------------------------------
RUN echo "export TZ=America/Sao_Paulo" >> /etc/profile
RUN echo "America/Sao_Paulo" > /etc/timezone
RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

## ----------------------------------------------------
## Nodejs e yarn
## ----------------------------------------------------
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential curl libpq-dev imagemagick git-all \
git-core zlib1g-dev build-essential libssl-dev libreadline-dev \ 
libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev \
libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Seta nosso path
ENV INSTALL_PATH /quickorder
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# Seta o path para as Gems
ENV BUNDLE_PATH /app-gems
# Copia nosso código para dentro do container
COPY . .
