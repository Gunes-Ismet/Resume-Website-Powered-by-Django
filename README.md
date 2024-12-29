# MyResume Project

A simple Django-based web application designed to showcase a user's resume.

## Features

- Built using Django and PostgreSQL.
- Admin interface with basic authentication (root / 1234).
- Easy to run and set up with Docker.

## Installation

To get started with this project, follow these steps:

### Prerequisites

Make sure you have **Docker** and **Docker Compose** installed on your machine. If not, you can download and install them from the official websites:

- [Install Docker](https://docs.docker.com/get-docker/)
- [Install Docker Compose](https://docs.docker.com/compose/install/)

### Steps to Run the Application

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/Gunes-Ismet/Resume-Website-Powered-by-Django.git
    cd Resume-Website-Powered-by-Django
    ```

2. Build the Docker containers with the following command. This will pull the necessary images and set up the application:

    ```bash
    make build
    ```

    The `make build` command will:
    - Build the Docker images
    - Start the containers
    - Run any necessary database migrations
    - Restore any initial data (if applicable)

3. After the containers are up and running, you can access the admin page by visiting:

    ```
    http://localhost:8000/admin/
    ```

4. Use the following credentials to log in as an admin:

    - **Username:** root
    - **Password:** 1234

### Accessing the Application

Once the project is running, you can view the site by visiting:
    ```
    http://localhost:8000
    ```
