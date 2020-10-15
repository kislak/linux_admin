## Docker
Владимир Дроздетский


абстракция от хост системы
легковесные изолировыные окружения
общий слоф фс
компановка и предсказуемость
простое управление зависимостями
дистрибуция, тиражированность, воспроизводимость

докер - приложение (запакованное с его зависимостями)

#### один контейнер - один процесс 
//так можно делать только если вы спосете чью-то жизнь
не запихиваем в контейнер трехэтажное приложение


docker uses
  namespace
    pid, net, mount
  cgroups (control groups)
    ограничение ресурсов (цпу память ввод/вывод гпу)
  UnionFS
    overlayfs2
    122 слоя
    -- squash
  RunC

----
docker daemon
  restful api (tcp, unix)
  cli


duntime
  dockerd
  containerd
  cri-o
  podman
  buildah
  kata containers
  rkt

network
  namespaces and iptables

docker registry
  docker hub
  private registry
  docker store
  gitlab
  harbor - free
    443
    8443

Docker build -f Dockerfile -t some_tag
// перерыв а потом пойдем шатать докер
ENV - 
ARG - during build
COPY - just copy
ADD - extended copy 
EXPOSE - documentation for ports
  //docs.docker.com

CMD
ENTRYPOINT

shell (run bash or zsh which run the command - pid - shell, second - process)
  FROM alpine
  ENTRYPOINT ping www.google.com

exec  (first pid - the command)
  FROM alpine
  ENTRYPOINT ["ping", "www.google.com"]

exec
  FROM alpine
  ENTRYPOINT ["ls", "/usr"]
  CMD ["/var"]


docker commit - образ из текущего контейнера
  docker commit, docker save, docker load
  
  
docker pull nginx
docker run -p 80:80 nginx  (-p host:container)
docker run -d -p 80:80 nginx
docker ps
docker inspect nginx
docker logs -f b2a467c8912a
docker exec -it b2a467c8912a bash


root@b2a467c8912a:/var/log/nginx# ls -lah
total 12K
drwxr-xr-x 2 root root 4.0K Sep 10 12:33 .
drwxr-xr-x 1 root root 4.0K Sep 10 12:33 ..
lrwxrwxrwx 1 root root   11 Sep 10 12:33 access.log -> /dev/stdout
lrwxrwxrwx 1 root root   11 Sep 10 12:33 error.log -> /dev/stderr

12 factors 

docker stop b2a467c8912a
docker rm b2a467c8912a

сеанс совсем черной магии


FROM golang:latest
LABEL maintainer="SK"
WORKDIR /app
COPY . .
RUN go build -o main .
CMD ["./main"]



multistage
  docker images (alpine + bin 17 mb -) 

apk --no-cache add ca-certificates

------------------------------------------
docker 2

сети
  native 
    встроенные 
  remote
    overlay networks
    
взаимодействие контейнеров  
  ip-address
  links (деприкейтед)
  docker dns
  external service discovery (dns)

modules (драйвера)
  none (loopack)
  host (network namespace - к интерфейсу хоста)
  bridge 
    docker0
      нет айпи адрессации
      нет сервис дисковери
    my_bridge
    iptables/nat
      > ```sudo iptables -S```
      > ```sudo iptables -t nat```
      ?? brctl  
    docker network ls        
  macvlan
    sub-interfaces linux
    802.1q     
  overlay (swarm)
    vtep 4789/udp
    vxlan


docker run --rm -d --name ubuntu1 ubuntu sleep 3000

ping 8.8.8.8
ping tut.by
ip -4 a

# ping
apt install dnsutils (dig) 
apt install jq
apt install net-tools
ss -tlpn
netstat -an |grep LISTEN

volumes
docker-compose
  network:
    aliases:
      - db

docker-compose down -v


limit resources see docs.docker.com
  docker run
    --cpu
    --memory
