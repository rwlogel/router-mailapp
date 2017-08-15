FROM node:7.10.0

RUN set -x && \
    apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" \
            > /etc/apt/sources.list.d/vscode.list' \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
            code \
            libnotify4 \
            libgconf-2-4 \
            libnss3 \
            libgtk2.0-0 \
            libxss1 \
            libgconf-2-4 \
            libasound2 \
            libxtst6 \
            libcanberra-gtk-dev \
            libgl1-mesa-glx \
            libgl1-mesa-dri \
    && rm -rf /var/lib/apt/lists/* \
    ;

RUN mkdir /proj
WORKDIR /proj
ADD package.json /proj/

RUN npm install

USER node

