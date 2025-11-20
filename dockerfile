# ====== STAGE 1: Build ======
FROM ubuntu:latest AS build

# Atualiza e instala Java 21 + Maven
RUN apt update && apt install -y openjdk-21-jdk maven

# Define JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Copia o projeto
WORKDIR /app
COPY . .

# Gera o JAR
RUN mvn clean package -DskipTests

# ====== STAGE 2: Run ======
FROM ubuntu:latest

# Instala apenas o JRE necessário para rodar o app
RUN apt update && apt install -y openjdk-21-jre

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

WORKDIR /app

# Copia o JAR criado no build
COPY --from=build /app/target/*.jar app.jar

# Porta do Spring Boot
EXPOSE 8080

# Comando de execução
ENTRYPOINT ["java", "-jar", "app.jar"]
