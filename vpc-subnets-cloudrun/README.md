# Terraform Module: VPC, Subnets, and Cloud Run Service

This Terraform module sets up a Virtual Private Cloud (VPC), subnets, and a Cloud Run service on Google Cloud Platform (GCP).

## Table of Contents

- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Requirements](#requirements)
- [Providers](#providers)
- [Resources](#resources)

## Usage

To use this module, include the following code in your Terraform configuration:

```hcl
module "network" {
  source = "./path/to/module"

  project_id             = "your-project-id"
  region                 = "us-central1"
  vpc_name               = "my-vpc"
  vpc_cidr               = "10.0.0.0/16"
  subnet_cidrs           = ["10.0.1.0/24", "10.0.2.0/24"]
  cloud_run_service_name = "cloud-run-service"
  cloud_run_image        = "gcr.io/my-project/my-image"
  cloud_run_memory       = "512Mi"
}

**Access the Cloud Run service**: After applying the Terraform configuration, the service URL will be output.
url = "https://cloud-run-service-juuyfgzosa-uc.a.run.app"
