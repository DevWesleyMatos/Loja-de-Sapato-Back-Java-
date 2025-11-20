# Usa Ubuntu como base
FROM ubuntu:22.04

# Atualiza pacotes e instala dependências mínimas
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    apt-transport-https \
    ca-certificates

# Adiciona o repositório oficial da Adoptium (Temurin) para instalar o Java 25
RUN wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
    echo "deb https://packages.adoptium.net/artifactory/deb jammy main" | tee /etc/apt/sources.list.d/adoptium.list

# Instala o Java 25
RUN apt-get update && apt-get install -y temurin-25-jdk

# Instala Maven
RUN apt-get install -y maven

# Define o diretório de trabalho
WORKDIR /app

# Copia arquivos Maven para cache
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Permissão ao mvnw
RUN chmod +x mvnw

# Baixa dependências
RUN ./mvnw dependency:go-offline

# Copia o código-fonte
COPY src ./src

# Compila o projeto
RUN ./mvnw clean package -DskipTests

# Expondo porta do Spring
EXPOSE 8080

# Executa o .jar
CMD ["java", "-jar", "target/*.jar"]
