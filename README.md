# JBoss/Wildfly Deployment Hands-on Demo


본 실습에 상용되는 소프트웨어 버전입니다.
- [docker](https://docs.docker.com/get-docker/) v19.03.13
- [docker-compose](https://docs.docker.com/compose) v1.27.4
- [openjdk 8](https://hub.docker.com/_/openjdk) docker 이미지
- [mariadb 10](https://hub.docker.com/_/mariadb) docker 이미지
- [jboss eap 7](https://access.redhat.com/products/red-hat-jboss-enterprise-application-platform/) 패키지
- [wildfly 18.0.1](https://www.wildfly.org/downloads/) 패키지 *Optional

## 사전 설치 

> 본 실습은 docker 환경으로 구성되어 있습니다. 인터넷이 가능한 환경과 docker가 설치된 실습환경이 필요합니다.
> docker 실습 환경은 [docker](https://docs.docker.com/get-docker/)에서 확인하여 사전에 설치합니다.

- [x] 리눅스 환경에서는 docker-compose 가 설치되어 있지 않습니다. 추가 설치가 필요합니다. [docker-compose](https://docs.docker.com/compose/install/) 보기
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

$ docker-compose --version
docker-compose version 1.27.4, build 1110ad01
```  

## 1. JBoss 설치
```

```

## 2. JBoss 관리콘솔 접속하기 
```

```

## 3. JBoss 디비 설정하기 
```

```

## 4. 샘플어플리케이션 배포

### 4.1 session.war
```
```

### 4.2 jpetstore 
- 샘플 스프링 프레임워크(jpetstore) 다운로드 
```
git clone https://github.com/mybatis/jpetstore-6.git
```

- 스프링 프래임워크 jdbc 설정

- [x] ./jpetstore-6/src/main/webapp/WEB-INF/applicationContext.xml
기존 메모리 데이터소스 부분 삭제
```
 <!-- in-memory database and a datasource --> 
 <!--
    <jdbc:embedded-database id="dataSource">
        <jdbc:script location="classpath:database/jpetstore-hsqldb-schema.sql"/>
        <jdbc:script location="classpath:database/jpetstore-hsqldb-dataload.sql"/>
    </jdbc:embedded-database>
-->
```

- [x] JBoss 에서 등록된 datasource jndi 추가
```
<!-- mariadb database -->
<bean id="dataSource" class="org.springframework.jndi.JndiObjectFactoryBean">
	<property name="jndiName">
		<value>java:jboss/MariaDBDS</value>
	</property>
</bean>
```

- 스프링 프래임워크 빌드
```
docker run -v "${PWD}:/usr/app/myapp" -v "${PWD}/m2/:/root/.m2/" -w /usr/app/myapp maven:3-jdk-8 mvn install 
```

## 5. mariadb 설정 및 데이터 입력
- docker-compose.xml 내에 mariadb 설정 추가
```
    database:
        image: mariadb:10.5
        environment: 
            TZ: "Asia/Seoul"
            MYSQL_ROOT_PASSWORD: jboss
            MYSQL_DATABASE: jbossdb
            MYSQL_USER: jboss
            MYSQL_PASSWORD: jboss
        volumes:
            - ./database/data:/var/lib/mysql:rw 
            - ./database/init:/docker-entrypoint-initdb.d:rw 
            - ./database/log:/var/log/mysq:rw
```

### mariadb 용 스키마 및 데이터 입력
docker 실행시 자동으로 설정된 데이터베이스, 사용자 정보, 스키마 및 데이터를 생성합니다.

- [x] [jpetstore mysql schema](https://raw.githubusercontent.com/nationminu/jboss-demo/master/database/init/1.%20jpetstore-mysql-schema.sql) 다운로드
```bash
wget https://raw.githubusercontent.com/nationminu/jboss-demo/master/database/init/1.%20jpetstore-mysql-schema.sql
```
- [x] [jpetstore mysql data](https://raw.githubusercontent.com/nationminu/jboss-demo/master/database/init/2.%20jpetstore-mysql-dataload.sql) 다운로드
```bash
wget https://raw.githubusercontent.com/nationminu/jboss-demo/master/database/init/2.%20jpetstore-mysql-dataload.sql
```
- [x] 프로젝트 내 "./database/init" 디렉토리에 아래에 스키마 파일 과 데이터 파일을 복사 
