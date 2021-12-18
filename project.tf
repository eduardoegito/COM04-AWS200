### As a pre-requisite for COM4-AWS200, it is required to complete the activities of COM4-AWS100 project. 
### So, this project is divided in two parts for the two projects. 

#### COM4-AWS100 - ACTIVITIES
##### TASK 1 - Create your Amazon ECR repository
##### TASK 2 - Authenticate your Docker to Amazon ECR
##### TASK 3 - Tag your Docker image with the Amazon ECR repository
##### TASK 4 - Push your image to Amazon ECR

#### COM4-AWS200 - ACTIVITIES
##### TASK 5 - Configure your container with your Docker image
##### TASK 6 - Configure your task definition
##### TASK 7 - Define your service
##### TASK 8 - Configure your cluster



##### TASK 1 - Create your Amazon ECR repository
resource "aws_ecr_repository" "caduegito" {
  name                 = "caduegito"
  image_tag_mutability = "MUTABLE"
}

##### TASK 3 - Tag your Docker image with the Amazon ECR repository && TASK 4 - Push your image to Amazon ECR
resource "docker_registry_image" "nginx" {
    name = "${aws_ecr_repository.caduegito.repository_url}:latest"

    build {
        context = "app"
        dockerfile = "Dockerfile"
    }
}