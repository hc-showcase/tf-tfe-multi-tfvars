provider "tfe" {
}

resource "tfe_workspace" "dev" {
  name         = "acr-dev"
  organization = "mkaesz-dev"
}

resource "tfe_workspace" "prod" {
  name         = "acr-prod"
  organization = "mkaesz-dev"
}

resource "tfe_variable" "dev-vars" {
  key          = "TF_CLI_ARGS_plan"
  value        = "-var-file=var-files/dev-vars.tfvars"
  category     = "env"
  workspace_id = tfe_workspace.dev.id
  description  = "point to the tfvars file containing all dev vars"
}

resource "tfe_variable" "prod-vars" {
  key          = "TF_CLI_ARGS_plan"
  value        = "-var-file=var-files/prod-vars.tfvars"
  category     = "env"
  workspace_id = tfe_workspace.prod.id
  description  = "point to the tfvars file containing all prod vars"
}
