FROM jekyll/jekyll

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

VOLUME ['/src']

WORKDIR "/src"

CMD ["jekyll", "serve", "--watch", "--baseurl=''"]
