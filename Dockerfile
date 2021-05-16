FROM openjdk:8-jre-alpine
# 1. user, group 추가
RUN addgroup -S spring && adduser -S spring -G spring

# 2. 위에서 만든 user, group 으로 전환
USER spring:spring

# 3. spring boot build시에 생성되는 jar 파일 위치 등록
ARG APP_NAME=market-blog
ARG APP_DIR=target/unpack-app/
ARG LIB_DIR=target/unpack-lib/

# 4. workdir 생성,설정
RUN ["mkdir", "-p", "/home/spring/${APP_NAME}"]
WORKDIR /home/ggoowlgns/${APP_NAME}

# 4. src들 이동
COPY ${LIB_DIR} BOOT-INF/lib
COPY ${APP_DIR} .

# 5. 실행
ENV PROFILE=local
ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILE}","org.springframework.boot.loader.JarLauncher"]