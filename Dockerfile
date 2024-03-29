FROM arwynfr/armake2:alpine as base

RUN apk add --no-cache python3
RUN ln -sf python3 /usr/bin/python


# Install python/pip
ENV PYTHONUNBUFFERED=1

RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY ./entrypoint.sh /entrypoint.sh
COPY tools /tools
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]