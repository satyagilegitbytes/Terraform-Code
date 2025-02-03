# Manages a GitHub repository with configurable settings
resource "github_repository" "repo" {
  name               = var.repo_name          # Repository name from variable
  description        = var.repo_description   # Repository description from variable
  visibility         = var.repo_visibility    # Public/private status from variable
  auto_init          = true                   # Always initialize with empty README
  allow_merge_commit = var.allow_merge_commit # Merge commit allowance from variable
  allow_squash_merge = var.allow_squash_merge # Squash merge allowance from variable
  allow_rebase_merge = var.allow_rebase_merge # Rebase merge allowance from variable
  has_issues         = var.has_issues         # Issues feature toggle from variable
  has_projects       = var.has_projects       # Projects feature toggle from variable
  has_wiki           = var.has_wiki           # Wiki feature toggle from variable
}

# Manages repository topics (tags) for better discoverability
resource "github_repository_topics" "repo_topics" {
  repository = github_repository.repo.name  # Reference to created repository
  topics     = var.topics                   # List of topics from variable
  depends_on = [github_repository.repo]     # Ensure repo exists before adding topics
}

# Creates multiple branches for the repository
resource "github_branch" "branches" {
  for_each   = toset(var.branches)          # Convert branches list to set
  repository = github_repository.repo.name  # Reference to created repository
  branch     = each.value                   # Branch name from iteration
  depends_on = [github_repository.repo]     # Ensure repo exists before creating branches
}

# Sets the default branch for the repository
resource "github_branch_default" "default" {
  repository = github_repository.repo.name  # Reference to created repository
  branch     = var.default_branch           # Default branch name from variable
  depends_on = [github_branch.branches]     # Ensure branches exist before setting default
}

# Manages repository collaborators with conditional creation
resource "github_repository_collaborator" "collaborator" {
  count      = var.repository_access_level != "none" ? 1 : 0  # Create only if access needed
  repository = github_repository.repo.name  # Reference to created repository
  username   = var.github_owner             # GitHub username from variable
  permission = var.repository_access_level == "user" ? "push" : "pull"  # Set permission level
  depends_on = [github_repository.repo]     # Ensure repo exists before adding collaborator
}