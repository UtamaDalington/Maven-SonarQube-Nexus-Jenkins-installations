This script updates the system, installs OpenJDK 11, and installs Maven on Ubuntu EC2 instance.

## Steps To Install Apache Maven and Java 11 on your EC2 instance

1. Connect to your Ubuntu EC2 instance with an SSH client.

2. Update package lists and upgrade all installed packages.

    ```
    sudo apt update -y
    sudo apt upgrade -y
    ```
3. Install OpenJDK 11 (a prerequisite for Maven).

    ```
    sudo apt install openjdk-11-jdk -y
    ```
4. Verify the Java installation.

   ```
   java -version
   ```
5. Install Maven.

    ```
    sudo apt install maven -y
    ```
6. Verify the Maven installation.

    ```
    mvn -v
    ```
### Project Preparation
7. Create the `.m2` directory in the home directory of your current user.

    ```
    mkdir ~/.m2
    ```
8. Create the Settings file inside of the `~/.m2` directory.

    ```
    cd ~/.m2/
    cp demo/settings.xml ~/.m2/
    ```
