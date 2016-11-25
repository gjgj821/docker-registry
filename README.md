# Docker Private Registry

## Feature
- 建立docker的私有registry
- 使用token进行权限控制
- 用docker-compose进行服务管理

## Install Env
- Install git
- Install Docker
- Install Docker compose

## Install Step
"""
进入目录后执行下列操作
"""
- 下载portus：
    - git clone https://github.com/SUSE/Portus.git
- 创建密钥
    - cd certs && openssl req -x509 -days 3650 -subj '/CN=registry.domain.com' -nodes -newkey rsa:2048 -keyout registry.key -out registry.crt && cd ..;
- 开启端口
    - 5000 ：registry端口
    - 5001 ：registry debug端口
- DNS设置
    - 配置registry.domain.com到安装服务器
- 操作：
    - 启动registry：./start-registry.sh
    - 重启：docker-compose restart -d

## Registry Usage
- 下载证书:
    - /etc/docker/certs.d/registry.domain.com:5000/
- 登陆registry：
    - docker login registry.domain.com:5000
- push：
    - docker push registry.domain.com:5000/image:1.0
- pull：
    - docker pull registry.domain.com:5000/image:1.0

## Auth Mode
- none：无访问权限控制
- htpasswd：可进行用户验证
    - 可以通过init.sh创建账户
- token：可按用户区分操作权限
    - base：可进行pull和push权限控制
        - 可通过init.sh创建账户
        - 权限需编辑auth_config.yml
    - Portus：提供界面操作

## Portus Usage
- 登陆token服务：
    - https://registry.domain.com:3000
