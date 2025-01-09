# Stage 1: Build the application with .NET 6 SDK
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o out

# Stage 2: Run the application with .NET 6 Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .

# Set the URL to listen on port 5000
ENV ASPNETCORE_URLS=http://0.0.0.0:5000

ENTRYPOINT ["dotnet", "ECPDotNetApp.dll"]
EXPOSE 5000
