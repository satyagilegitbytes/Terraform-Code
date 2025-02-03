# Define the GitHub personal access token (sensitive data)
variable "github_token" {
  description = "GitHub personal access token"  # Token used for authenticating with GitHub
  type        = string                         # Token is a string type
  sensitive   = true                           # Mark the token as sensitive (for security)
}

# Define the GitHub owner (can be a user or an organization)
variable "github_owner" {
  description = "GitHub owner (user or organization)"  # Owner of the GitHub repositories
  type        = string                           # The owner is a string (user or organization name)
}

# Define the map of repository configurations
variable "repositories" {
  description = "Map of repository configurations"  # Map containing configurations for each repository
  type = map(object({
    # Repository name
    repo_name              = string
    
    # Repository description
    repo_description       = string
    
    # Repository visibility (public or private)
    repo_visibility        = string
    
    # Repository access level (options: none, user, organization)
    repository_access_level = string
    
    # Default branch for the repository
    default_branch         = string
    
    # List of branches to create in the repository
    branches               = list(string)
    
    # List of topics to add to the repository
    topics                 = list(string)
    
    # Whether to allow merge commits
    allow_merge_commit     = bool
    
    # Whether to allow squash merges
    allow_squash_merge     = bool
    
    # Whether to allow rebase merges
    allow_rebase_merge     = bool
    
    # Whether to enable issues for the repository
    has_issues             = bool
    
    # Whether to enable projects for the repository
    has_projects           = bool
    
    # Whether to enable the wiki for the repository
    has_wiki               = bool
    ruleset_name           = string
    ruleset_target         = string
    ruleset_enforcement    = string
    ruleset_ref_include    = list(string)
    ruleset_ref_exclude    = list(string)
    ruleset_required_checks = list(string)
  }))
}
