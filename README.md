# JBoss/Wildfly Deployment Hands-on Demo

> 본 실습은 docker 환경으로 구성되어 있습니다. 인터넷이 가능한 환경과 docker가 설치된 실습환경이 필요합니다.
> docker 실습 환경은 [docker](https://docs.docker.com/get-docker/)에서 확인하여 사전에 설치합니다.

- [ ] 리눅스 환경에서는 docker-compose 가 설치되어 있지 않습니다. 추가 설치가 필요합니다. [docker-compose](https://docs.docker.com/compose/install/) 보기
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```  