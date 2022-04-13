#Install HAPROXY
apt update && apt install -y haproxy

#configure HAPROXY - add the below lines in /etc/haproxy/haproxy.cfg

frontend kubernetes-frontend
  bind {haproxyserverip}:6443
  mode tcp
  option tcplog
  default_backend kubernetes-backend

backend kubernetes-backend
  mode tcp
  option tcp-check
  balance roundrobin
  server master1 ip:6443 check fall 3 rise 2
  server master1 ip:6443 check fall 3 rise 2
  
#Restart haproxy service
 systemctl restart haproxy
 

