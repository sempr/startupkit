# Intro

## 1. create a server with centos 7

## 2. prepare your centos 7, now only support centos 7.x

run the script prepare.sh

## prepare your domain and dns

point  *.demo.bigking.tk and demo.bigking.tk to your server ip

## clone the codes

cd /srv; git clone https://github.com/sempr/startupkit.git

## config codes

change config in cf.env, see [this document](https://hub.docker.com/r/goacme/lego)

`DNS providers` section

## replace your domain

```
grep -rl "demo.bigking.tk"  | xargs sed -i 's+demo.bigking.tk+huzhengben.com+g'
grep -rl "dc=demo,dc=bigking,dc=tk"  | xargs sed -i 's+dc=demo,dc=bigking,dc=tk+dc=huzhengben,dc=com+g'
grep -rl "DEMO-CORP"  | xargs sed -i 's+DEMO-CORP+Huzhengben-Corp+g'
```

## create dhparam file

```
openssl dhparam -dsaparam -out data/acme/.lego/certificates/dhparam.pem 4096
```

## start services in order
```
docker-compose up acme
sleep 30
docker-compose up -d nginx
docker-compose up -d gitea ldap ldap-fe

# config db, create admin
docker-compose up gitea2

## see https://docs.drone.io/installation/providers/gitea/ to config gitea and drone
## create app, edit .env for it

# start all
docker-compose up -d
```

## use cases

1. goto https://ldap.demo.bigking.tk to see the phpldapadmin
1. goto https://git.demo.bigking.tk to see the git server
1. use `rabbit/dog/bear/zookeeper` login the git server with password `password10000`,  user `lion` is not allowed, `bear`,`dog`,`rabbit` is normal user and `zookeeper` is the admin. more about user config, see `data/ldap/custom/main.ldif`
1. change user groups for allow or not allow login.

## TODO

1. auto renew letsencrypt by goacme, add crontab script for `docker-compose up acme`
