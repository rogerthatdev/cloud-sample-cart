output "artifact_registry_repo_url" {
  value = "${google_artifact_registry_repository.default.location}-docker.pkg.dev/${google_artifact_registry_repository.default.project}/${google_artifact_registry_repository.default.name}"
}

output "filestore_instance_ip" {
  value = google_filestore_instance.default.networks[0].ip_addresses[0]
}

output "filestore_instance_share_name" {
  value = google_filestore_instance.default.file_shares[0].name
}
