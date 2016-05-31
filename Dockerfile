FROM soulmaneller/nodejs

MAINTAINER itzco <mritzco@gmail.com>


RUN /bin/bash -c ' \
    source /root/.nvm/nvm.sh && \
    echo -e "#!/bin/bash\\n: \${1?\"Usage: \$0 SCRIPT_NAME\"}\n if [[ "\$1" == 'bash' ]]; then \n /bin/bash \n else \n $(which node) \${1} \n fi" > /usr/entry.sh && \
    chmod +x /usr/entry.sh  \
'

ENV NODE_PATH=$NODE_PATH:./lib:./

WORKDIR /src

ENTRYPOINT ["/usr/entry.sh"]
CMD ["index.js"]
