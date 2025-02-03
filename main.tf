# Configure the GitHub provider with token and owner details
provider "github" {
  token = var.github_token          # GitHub token used for authentication
  owner = var.github_owner          # GitHub owner (user or organization)
}

# Define the module for creating GitHub repositories
module "github_repo" {
  for_each = var.repositories        # Iterate over the list of repositories provided in the variable

  source = "./modules/github-repo"  # Path to the module that will create the GitHub repository

  # Pass repository-specific parameters to the module
  repo_name              = each.value.repo_name                 # Name of the repository
  github_owner           = var.github_owner                     # GitHub owner (user or organization)
  repo_description       = each.value.repo_description          # Description of the repository
  repo_visibility        = each.value.repo_visibility           # Visibility of the repository (public/private)
  repository_access_level = each.value.repository_access_level # Access level for the repository (none/user/organization)
  default_branch         = each.value.default_branch            # Default branch for the repository
  branches               = each.value.branches                  # List of branches to create in the repository
  topics                 = each.value.topics                    # List of topics to add to the repository
  allow_merge_commit     = each.value.allow_merge_commit        # Whether to allow merge commits
  allow_squash_merge     = each.value.allow_squash_merge        # Whether to allow squash merges
  allow_rebase_merge     = each.value.allow_rebase_merge        # Whether to allow rebase merges
  has_issues             = each.value.has_issues                # Whether to enable issues for the repository
  has_projects           = each.value.has_projects              # Whether to enable projects for the repository
  has_wiki               = each.value.has_wiki                  # Whether to enable the wiki for the repository
}
