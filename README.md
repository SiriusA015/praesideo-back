# Presideo back-end

### Prerequisites

- Java 11
- Maven
- Docker

### How to start the application in DEV mode

- Set environment variable `spring_profiles_active=dev`
- Start a local database by running  [run-db.sh ](../../scripts/run-db.sh)
- Run [MainApp](./src/main/java/earth/praesideo/MainApp.java)
- The application is available locally at http://localhost:8080

### How to start the application in PROD mode

- Set environment variable `spring_profiles_active=dev`
- Run [MainApp](./src/main/java/earth/praesideo/MainApp.java)
- The application is available locally at http://localhost:8080

### Swagger

http://localhost:8080/swagger-ui.html

### Deploy back-end in AWS

- Check the commands from SH file [upload-to-ec2.sh ](../../scripts/upload-to-ec2.sh)

### Testing Version
1.2