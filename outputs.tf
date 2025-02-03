output "repository_urls" {
  description = "URLs of all created repositories"
  value       = [for repo in module.github_repo : repo.repository_url]
}

output "repository_names" {
  description = "Names of all created repositories"
  value       = [for repo in module.github_repo : repo.repository_name]
}