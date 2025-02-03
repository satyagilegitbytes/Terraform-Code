output "repository_url" {
  description = "URL of the created repository"
  value       = github_repository.repo.html_url
}

output "repository_name" {
  description = "Name of the created repository"
  value       = github_repository.repo.name
}