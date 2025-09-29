This script installs Apache HTTP Server, WordPress, and MySQL Database using Docker.

## Steps To Install Apache HTTP Server, WordPress, and MySQL Database on your EC2 instance with Docker

1. Connect to your Ubuntu EC2 instance with an SSH client.

2. Check the Docker version.

    ```
    docker --version
    ```
3. Run the Container Application.
# docker run --name PERSONAL_CONTAINER_NAME -p HOST_PORT:CONTAINER_PORT -d IMAGE_NAME

    ```
    docker run --name apache-webserver -p 8000:80 -d httpd:latest
    ```
4. Create a docker network.

   ```
   docker network create wp-net
   ```
5. Deploy the WordPress Application.

    ```
    docker run -d \
    --name wordpress-app \
    --network wp-net \
    -p 8080:80 \
    -e WORDPRESS_DB_HOST=mysql-db:3306 \
    -e WORDPRESS_DB_USER=wpuser \
    -e WORDPRESS_DB_PASSWORD=wppass \
    -e WORDPRESS_DB_NAME=wordpress \
    wordpress:latest
    ```
6. Deploy Database for the WordPress Application.

    ```
    docker run -d \
    --name mysql-db \
    --network wp-net \
    -e MYSQL_ROOT_PASSWORD=rootpass \
    -e MYSQL_DATABASE=wordpress \
    -e MYSQL_USER=wpuser \
    -e MYSQL_PASSWORD=wppass \
    mysql:5.7
    ```
