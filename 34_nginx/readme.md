## nginx


директивы
  имя прамс;

контекст
базовый конфиг include
  /etc/nginx/nginx.conf
    error_log  xx.log warn;
    pid  
    events
    http {
      include /etc/nginx/mime.types; #content-type
      default_type application/octet-stream;
      
      log_format main '$remote_addr - $remotee_use [$time_local] "request" '
                      '$status $body_types_sent "$http_refere" '
                      
      acceess_log /var/log/ngingx/access.log main;
      
      sendfile on;   # direct file directly to socket (better then apache)
      tcp_nopush on; #
      
      keepalive_timeout 65;
      
      include /etc/ngingx/conf.d/*.conf;
    }

  #link from site-available
  #ln -s /site-availabe/
      
   
order
  http {
    server {
      listen 80 default_server;
      server_name _;
      location / {
        ...
      } 
    }
  }
  
  


listen
  listen 127.0.0.1;
  listen [::]:8000;
  listen unix:/var/run/nginx.sock;
    (root 80, user 8000)
    <1024 - root only
    
  > ss -tulpn
  
  каждый listen default_server


  create fake ip
  sudo 
    ip link add dummy0 type dummy
    ip addr add 192.168.1.10/32 dev dummy0

    #!/bin/bash
    set -e
    IP=${1:-127.0.0.1}
    PORT=${2:-80}
    HOSTNAME=$3
    exec 3<>/dev/tcp/$IP/$PORT
    echo -e "GET / HTTP/1.1\r\nhost: $HOSTNAME\r\nConnection: close\r\n\r\n" >&3
    cat <%3

  
server_name
  order
    1 www.example.com
    2 *.example.com
    3 api.*
    4 ~reg
    5 default_server (first for port)

  host: - server will  pick corresponding rec    

  server {
    server_name ~^(www\.)?(?<domain>.+)$;
    root /sites/$domain
  }

  
location
  нормализованый вид
    https://ru.wikipedia.org/wiki/%D0%9D%D0%BE%D1%80%D0%BC%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F_URL
  1 /
  2 ^~
  3 ~             #      ~* - без учета регистра
  

proxy_pass (http)
  fastcgi_pass (fastcgi)
  uwssgi_pass
  scgi_pass
  memcachedd_pass 
  grpc_pass

  ?? - terminate https (ssl)
  

upstream backend {
  ip_hash; 
  server    192.168.1.1 weight=5;
  server    192.168.1.1 backup;
}

Mumshad Mannambeth
https://learning.oreilly.com/search/?query=Mumshad%20Mannambeth&extended_publisher_data=true&highlight=true&include_assessments=false&include_case_studies=true&include_courses=true&include_playlists=true&include_collections=true&include_notebooks=true&is_academic_institution_account=false&source=user&sort=relevance&facet_json=true&page=0&include_facets=false&include_scenarios=true&include_sandboxes=true&json_facets=true


return
  return (301|302|303|307) url; (301 - permanent browser remember; 302 - temp - per req)
  return (1xx) ["text"];
  $scheme (http|https)
  return 301 $scheme://www.new.com$request_uri;
  
  
  server {
    listen 80 default;
    server_name _;
    return 301 $scheme://www.exp.com;
  }

rewrite 
  last
  break
  redirect 302
  permanent 301


location / {
  try_files /system/mainteenance.html $uri $uri/index.html $uri.html @namedloc;
}
  
proxy_cache_path /tmp/nginx/cache levels=1:2 keyss_zone=proxy_zone:50m inactive=1h;
proxy_cache proxy_zone;
add_header X-Proxy-Cache $upstream_cache_status;
proxy_cache_methods GET HEAD;
proxy_cache_valid 200 302 10m;

load_module modules/ngx_http_js_module.so
