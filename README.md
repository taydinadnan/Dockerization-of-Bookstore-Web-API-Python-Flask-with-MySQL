# Project-202: Dockerization of Bookstore Web API (Python Flask) with MySQL

## Description

Bookstore Web API Application aims to create a bookstore web service using Docker to give students an understanding of the dockerization of an application. The application code is to be deployed as a RESTful web service with Flask using Dockerfile and Docker Compose on AWS Elastic Compute Cloud (EC2) Instance using AWS Cloudformation Service.

## Problem Statement

![Project_201](201-bookstore-api.png) 

- Your team has started working on a project to create a `Bookstore` Application as Web Service.  

- Software Developers in your team have already developed the first version of the `Bookstore` application. They have designed a database to keep book records with the following fields.

  - `book_id`: a unique identifier for books, type is numeric.

  - `title`: title of the book, type is string.

  - `author`: author of the book. type is string.

  - `is_sold`: book availability status, type is boolean.

- Your teammates also created the RESTful web service as given in [Bookstore API](./bookstore-api.py) using the Python Flask Framework. Below table shows how the HTTP methods are designed to affect the given resources identified by URIs.

| HTTP Method  | Action | Example|
| --- | --- | --- |
| `GET`     |   Obtain information about a resource | http://[ec2-hostname]/books (retrieves a list of all books) |
| `GET`     |   Obtain information about a resource | http://[ec2-hostname]/books/123 (retrieves a book with id=123) |
| `POST`    |   Create a new resource               | http://[ec2-hostname]/books (creates a new book, from data provided with the request) |
| `PUT`     |   Update a resource                   | http://[ec2-hostname]/books/123 (updates the book with id=123, from data provided with the request) |
| `DELETE`  |   Delete a resource                   | http://[ec2-hostname]/books/123 (deletes the book with id=123) |

- You are, as a cloud engineer, requested to deploy the app in the development environment on a Docker Machine on AWS EC2 Instance using AWS Cloudformation Service to showcase your project. To do that you need to;

  - Get the app code from GitHub repo of your team.

  - Create a docker image using the `Dockerfile`.

  - Deploy the app using `docker-compose`. To do so;

    - Create a database service using MySQL.

    - Configure the app service to run on `port 80`.

    - Use a custom network for the services.

- In the development environment, you can configure your Cloudformation template using the followings,

  - The application stack should be created with new AWS resources.

  - The application should run on Amazon Linux 2 EC2 Instance

  - EC2 Instance type can be configured as `t2.micro`.

  - Instance launched by Cloudformation should be tagged `Web Server of StackName`

  - The Web Application should be accessible via a web browser from anywhere.

  - The Application files should be downloaded from Github repo and deployed on EC2 Instance using a user data script within the cloudformation template.

  - Bookstore Web API URL should be given as output by Cloudformation Service after the stack is created.

## Expected Outcome

At the end of the project, the following topics are to be covered;

- MySQL Database Configuration

- Bash scripting

- Docker Images

- Docker Compose

- AWS EC2 Service

- AWS Security Group Configuration

- AWS Cloudformation Service

- AWS Cloudformation Template Design

- Git & Github for Version Control System

At the end of the project, students will be able to;

- configure connection to the MySQL database.

- build Docker images.

- configure Docker Compose to run a Python Flask app.

- improve bash scripting skills using the user data section in Cloudformation to install and set up a web application on an EC2 Instance.

- configure AWS EC2 Instance and Security Groups.

- configure Cloudformation template to use AWS Resources.

- use AWS Cloudformation Service to launch stacks.

- use git commands (push, pull, commit, add, etc.) and Github as a Version Control System.

- run the web application on AWS EC2 instance using the GitHub repo as a codebase.

## Steps to Solution
  
Step 1: Download or clone the project definition from the clarusway-aws-workshop repo on Github

Step 2: Create a project folder for a local public repo on your pc

Step 3: Prepare scripts to build a Python Flask App Image using Dockerfile and Docker Compose

Step 4: Prepare a Cloudformation template to deploy your app on an EC2 Instance

Step 5: Push your application into your own public repo on Github

Step 6: Deploy your application on AWS Cloud using a Cloudformation template to showcase your app within your team.
