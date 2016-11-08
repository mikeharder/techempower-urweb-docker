# techempower-urweb-docker

```
git clone https://github.com/TechEmpower/FrameworkBenchmarks
cd FrameworkBenchmarks/frameworks/Ur/urweb
git submodule add https://github.com/mikeharder/techempower-urweb-docker
docker build -t urweb-postgres -f techempower-urweb-docker/Dockerfile .
docker run -it --rm -p 8080:8080 -e DBHOST=db-name-or-ip urweb-postgres
```
