## Prebuilt Docker Image
You can pull and run the Docker image directly:

docker pull islamashraful07/ecpdotnetapp:latest
docker run -d -p 5063:5063 islamashraful07/ecpdotnetapp:latest

# Dockerized .NET Core MVC Application

## Prerequisites
- Install Docker: https://www.docker.com/get-started

## Steps to Build and Run the Application

1. Clone or download the project files.
2. Navigate to the project directory:
 
   cd <project-directory>

   
3.Build the Docker image:

	docker build -t my-dotnet-app .

4.Run the Docker container:

	docker run -d -p 5063:5063 my-dotnet-app

5.Open the application in a browser:

	http://localhost:5063
	
	
Notes

    Make sure port 5063 is available or change the mapping in the docker run command if necessary:

	docker run -d -p 5064:5063 my-dotnet-app