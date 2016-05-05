FROM soulmaneller/nodejs

MAINTAINER itzco <mritzco@gmail.com>

WORKDIR /src

RUN /bin/bash -c ' \
    source /root/.nvm/nvm.sh && \
    echo -e "#!/bin/bash\\n: \${1?\"Usage: \$0 SCRIPT_NAME\"}\n$(which node) \${1} " > entry.sh && \
    chmod +x entry.sh && \
'

ENTRYPOINT ["./entry.sh"]
CMD ["index.js"]
