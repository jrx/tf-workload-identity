provider "vault" {
}

data "vault_generic_secret" "example_creds" {
  path = "secret/username"
}

output "password" {
  value     = data.vault_generic_secret.example_creds.data["password"]
  sensitive = true
}