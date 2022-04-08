FROM node

WORKDIR /usr/src/app
COPY ../../dist/system ./system

RUN npm install -g npm && \
  # npm i -g pm2 && \
  npm i -g cross-env

    # "start": "cross-env HOST=0.0.0.0 cross-env PORT=3001 node .output/server/index.mjs"


# CMD ["pm2", "start", "./system/server/index.mjs", "--attach"]
CMD ["cross-env", "HOST=0.0.0.0", "cross-env", "PORT=3001", "node", "./system/server/index.mjs"]
