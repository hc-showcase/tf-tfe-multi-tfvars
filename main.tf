resource "tfe_workspace" "prod" {
  name         = "abc-prod"
  organization = "mkaesz-dev"
}

resource "tfe_workspace" "dev" {
  name         = "abc-dev"
  organization = "mkaesz-dev"
}

resource "tfe_variable" "prod-vars" {
  key          = "TF_CLI_ARGS"
  value        = "-var-file='var-files/prod-vars.tfvars'"
  category     = "env"
  workspace_id = tfe_workspace.prod.id
  description  = "point to the tfvars file containing all prod vars"
}

resource "tfe_variable" "dev-vars" {
  key          = "TF_CLI_ARGS"
  value        = "-var-file='var-files/dev-vars.tfvars'"
  category     = "env"
  workspace_id = tfe_workspace.dev.id
  description  = "point to the tfvars file containing all dev vars"
}

variable "message" {
  type = string
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo ${var.message}"
  }
}
