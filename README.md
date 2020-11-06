# JBoss/Wildfly Deployment Hands-on Demo


본 실습에 사용되는 소프트웨어 버전입니다.
* [docker](https://docs.docker.com/get-docker/) v19.03.13
* [docker-compose](https://docs.docker.com/compose) v1.27.4
* [openjdk 8](https://hub.docker.com/_/openjdk) docker 이미지
* [mariadb 10](https://hub.docker.com/_/mariadb) docker 이미지
* [jboss eap 7](https://access.redhat.com/products/red-hat-jboss-enterprise-application-platform/) 패키지
* [wildfly 18.0.1](https://www.wildfly.org/downloads/) 패키지 *Optional

<br/>

## Hands on 
데모/실습 목차

> [도커 사용방법](https://github.com/nationminu/docker-starter/blob/master/STARTER.md) 

* [도커에 JBoss/Wildfly 설치하기](01.Install.md)
---

* [JBoss 데이터소스 설정/연결 방법](02.Datasource.md) 
---
1. [JDBC 모듈 생성/로딩하기](./02.Datasource.md#1-jdbc-모둘-등록하기)
   1. [GUI를 이용한 JDBC 모듈로딩](./02.Datasource.md#11-gui-를-이용한-jdbc-모듈-로딩)
   2. [CLI을 이용한 JDBC 모듈 로딩](./02.Datasource.md#12-cli을-이용한-jdbc-모듈-로딩)
   3. [HTTP management API를 이용한 JDBC 모듈 로딩](./02.Datasource.md#13-http-management-api를-이용한-jdbc-모듈-로딩)
   4. [XML 을 이용한 JDBC 모듈 로딩](./02.Datasource.md#14-xml-을-이용한-jdbc-모듈-로딩)
2. [Datasource 등록하기](./02.Datasource.md#2-datasource-등록하기)
   1. [GUI 를 이용한 Datasoruce 등록](./02.Datasource.md#21-gui-를-이용한-datasoruce-등록)
   2. [CLI 를 이용한 Datasoruce 등록](./02.Datasource.md#22-cli-를-이용한-datasoruce-등록)
   3. [HTTP management API 를 이용한 Datasoruce 등록](./02.Datasource.md#23-http-management-api-를-이용한-datasoruce-등록)
   4. [XML 을 이용한 Datasoruce 등록](./02.Datasource.md#24-xml-을-이용한-datasoruce-등록)
   
* [JBoss 어플리케이션 배포 방법](03.Deployment.md)
---