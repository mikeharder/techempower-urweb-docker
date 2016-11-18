# techempower-urweb-docker

## server
```
git clone https://github.com/TechEmpower/FrameworkBenchmarks
cd FrameworkBenchmarks/frameworks/Ur/urweb
git submodule add https://github.com/mikeharder/techempower-urweb-docker
docker build -t urweb-postgres -f techempower-urweb-docker/Dockerfile .
docker run -it --rm -p 8080:8080 -e DBHOST=db-name-or-ip -e THREADS=cpu-count urweb-postgres
```

## client
```
wrk -c 256 -t 32 -d 10 http://server-ip-or-name:8080/fortunes
```
