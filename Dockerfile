FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends mlton libssl-dev libpq-dev make && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

ARG VERSION=20160621
ADD http://www.impredicative.com/ur/urweb-$VERSION.tgz .
RUN tar -xzvf urweb-$VERSION.tgz

WORKDIR /app/urweb-$VERSION

RUN ./configure --prefix=/app/urweb
RUN make
RUN make install

ENV URWEB_HOME=/app/urweb
ENV LD_LIBRARY_PATH=/app/urweb/lib
ENV PATH=/app/urweb/bin:$PATH

WORKDIR /app

ENV THREADS=24

CMD urweb -db "dbname=hello_world user=benchmarkdbuser password=benchmarkdbpass host=${DBHOST}" bench && ./bench.exe -q -k -t $THREADS
