# Cloud Run and filesystems 

This sample shows how to deploy a Cloud Run service that will mount a NFS filesystem (Cloud Filestore).


## Pre-reqs

A Google Cloud project will billing enabled and a default VPC on the project.  

## 1. Deploy required resources

Execute the terraform in the `terraform/` directory. This will create the resources you'll need later one, including a
Cloud Filestore instance. 

Note the output values, as you'll need them later on.  View the output values using:
`terraform output`


## 2. Review the sample code

### Wrapper script
`app/wrapper.sh` 

The values for the require environment variables will be provided when the application is deployed to Cloud Run.

### Dockerfile
`app/Dockerfile`

### Node.js app
`app/app.js`

## 3. Deploy to Cloud Run
