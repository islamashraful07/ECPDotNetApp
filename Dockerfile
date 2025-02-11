# Stage 1: Build the application
FROM ubuntu:latest AS build-env

# Set environment variables to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    apt-transport-https \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Add Microsoft package repository
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

# Install .NET 6 SDK
RUN apt-get update && apt-get install -y dotnet-sdk-6.0

# Set the working directory
WORKDIR /app

# Copy project files
COPY . .

# Publish the application
RUN dotnet publish -c Release -o out

# Stage 2: Create a runtime image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install ASP.NET Core runtime
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    apt-transport-https \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Add Microsoft package repository
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

# Install ASP.NET Core Runtime
RUN apt-get update && apt-get install -y aspnetcore-runtime-6.0

# Set the working directory
WORKDIR /app

# Copy the published application from the build stage
COPY --from=build-env /app/out .

# Set the URL to listen on port 5000
ENV ASPNETCORE_URLS=http://0.0.0.0:5063

# Set entry point
ENTRYPOINT ["dotnet", "ECPDotNetApp.dll"]

# Expose port 5000
EXPOSE 5001
