# Define the repository name
variable "repo_name" {
  description = "Name of the repository"
  type        = string
}

# Define the repository description
variable "repo_description" {
  description = "Description of the repository"
  type        = string
}

# Define the visibility of the repository (e.g., public or private)
variable "repo_visibility" {
  description = "Visibility of the repository (public or private)"
  type        = string
}

# Define the access level for the repository (options: none, user, organization)
variable "repository_access_level" {
  description = "Access level for the repository (none, user, organization)"
  type        = string
}

# Define the GitHub owner (either a user or organization)
variable "github_owner" {
  description = "GitHub owner (user or organization)"
  type        = string
}

# Define the default branch for the repository (defaults to "main")
variable "default_branch" {
  description = "Default branch for the repository"
  type        = string
  default     = "main"
}

# Define the list of branches to create in the repository
variable "branches" {
  description = "List of branches to create in the repository"
  type        = list(string)
  default     = ["main"]
}

# Define the list of topics to add to the repository
variable "topics" {
  description = "List of topics to add to the repository"
  type        = list(string)
  default     = []
}

# Define whether to allow merge commits
variable "allow_merge_commit" {
  description = "Whether to allow merge commits"
  type        = bool
  default     = true
}

# Define whether to allow squash merges
variable "allow_squash_merge" {
  description = "Whether to allow squash merges"
  type        = bool
  default     = true
}

# Define whether to allow rebase merges
variable "allow_rebase_merge" {
  description = "Whether to allow rebase merges"
  type        = bool
  default     = false
}

# Define whether to enable issues for the repository
variable "has_issues" {
  description = "Whether to enable issues for the repository"
  type        = bool
  default     = true
}

# Define whether to enable projects for the repository
variable "has_projects" {
  description = "Whether to enable projects for the repository"
  type        = bool
  default     = false
}

# Define whether to enable the wiki for the repository
variable "has_wiki" {
  description = "Whether to enable the wiki for the repository"
  type        = bool
  default     = false
}
