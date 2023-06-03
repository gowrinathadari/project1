#select base image from image and build war using maven
FROM maven:3-adoptopenjdk-8 as mvn_build
WORKDIR /app
COPY . .
RUN mvn clean package

#After building war file using mvn deploy to tomcat
FROM tomcat:11.0
COPY --from=mvn_build /app/target/*.war /usr/local/tomcat/webapps

