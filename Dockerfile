FROM soulmaneller/nodejs

MAINTAINER itzco <mritzco@gmail.com>


RUN /bin/bash -c ' \
    source /root/.nvm/nvm.sh && \
    echo -e "#!/bin/bash\\n: \${1?\"Usage: \$0 SCRIPT_NAME\"}\nif [[ "\$1" == 'bash' ]]; then \n    /bin/bash \nelse \n    $(which node) \${1} \nfi" > /usr/node_runner && \
    chmod +x /usr/node_runner  \
'

ENV NODE_PATH=$NODE_PATH:./lib:./

WORKDIR /src


ENTRYPOINT ["/usr/node_runner"]
CMD ["index.js"]
