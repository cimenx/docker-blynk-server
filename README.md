# Docker local Blynk server

## First time setup

Clone the docker-blynk-server project.

Go into /generateCerts directory and run
```
docker-compose up
```
This will generate self-signed ssl certificate and key in /server/certs/ directory

## Running the server

In the root directory of the project run

```
docker-compose up -d
```