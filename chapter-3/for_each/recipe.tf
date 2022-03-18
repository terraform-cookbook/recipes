variable "github_repositories" {
  # define variable as having a list of objects
  # each object must contain:
  #   * a key `name` with a value of type `string`
  #   * a key `visibility` with a value of type `string`
  type = list(object({
    name : string,
    visibility : string
  }))

  description = "List of GitHub Repositories"

  default = [
    {
      name : "my-public-repository"
      visibility : "public"
      }, {
      name : "my-private-repository"
      visibility : "private"
    },

  ]
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "repositories" {
  # iterate over each list item in `var.github_repositories`
  # and set `repository.name` as the key
  for_each = { for repository in var.github_repositories : repository.name => repository }

  # set name of the GitHub Repository from the `key` of each item
  # see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#name
  name = each.key

  # set `visibility` of the GitHub Repository from the `visibility` value of each item
  # see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#visibility
  visibility = each.value.visibility
}
