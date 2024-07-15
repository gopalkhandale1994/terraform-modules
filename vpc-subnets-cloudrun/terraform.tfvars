project_id             = "avian-bricolage-429512-k8"
region                 = "us-central1"
vpc_name               = "cloudrun-vpc"
vpc_cidr               = "10.0.0.0/16"
subnet_cidrs           = ["10.0.1.0/24", "10.0.2.0/24"]
cloud_run_service_name = "cloud-run-service"
cloud_run_image        = "us-central1-docker.pkg.dev/avian-bricolage-429512-k8/my-repo/hello-world:latest"
cloud_run_memory       = "512Mi"
