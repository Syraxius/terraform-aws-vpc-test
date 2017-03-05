# Terraform demo
This is a modified version of the terraform demo used in Edward Viaene's Online Course (see www.newtech.academy).

Edward Viaene's profile is at https://github.com/wardviaene/

This version is modified to work in Singapore (ap-southeast-1) region.

## Basic Configuration
To use this example, you need to add a terraform.tfvars with the following content:
```
AWS_ACCESS_KEY = "YOUR ACCESS KEY"
AWS_SECRET_KEY = "YOUR SECRET KEY"
AWS_REGION = "eu-west-1"
AWS_USERID = "123456"
```

## Building the Infrastructure
Execute the plan using terraform:
```
terraform plan   # to show the plan
terraform apply  # to apply the changes
```

## App Deployment Steps

### Build and upload the container to ECR
1. Go under the docker-php7-test folder
2. Build the image with `docker build -t php7:latest`
3. Retag the image using `docker tag php7:latest AWS_USERID.dkr.ecr.ap-southeast-1.amazonaws.com/php7:latest`
4. Push the image using `docker push AWS_USERID.dkr.ecr.ap-southeast-1.amazonaws.com/php7:latest`

### Deploy the app into EB
1. Go under the eb-docker-php7-test folder
2. Initialize EB configuration with `eb init`
3. Deploy the app using `eb deploy`
