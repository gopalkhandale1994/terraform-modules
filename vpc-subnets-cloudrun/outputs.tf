output "vpc_id" {
  description = "The ID of the VPC."
  value       = google_compute_network.vpc_network.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets."
  value       = [for subnet in google_compute_subnetwork.subnet : subnet.id]
}

output "cloud_run_service_url" {
  description = "The URL of the Cloud Run service."
  value       = data.google_cloud_run_service.cloud_run_service.status[0].url
}
