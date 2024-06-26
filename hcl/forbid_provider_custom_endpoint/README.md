# Forbid google provider custom endpoints

This lint rule forbids Google provider's custom endpoints.

https://registry.terraform.io/providers/wiardvanrij/ipv4google/latest/docs/guides/provider_reference

e.g.

```tf
provider "google" {
  # ... potentially other provider configuration ...
  storage_custom_endpoint = "http://localhost:4000/"
}
```

## Why?

Attackers can abuse Google provider's custom endpoints to take secrets away.

https://engineering.mercari.com/en/blog/entry/20230706-bucket-full-of-secrets-terraform-exfiltration/

## Usage

```jsonnet
function(param) {
  targets: [
    {
      data_files: [
        '**/*.tf',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/terraform-google/hcl/forbid_provider_custom_endpoint/main.jsonnet@ecb6742573c7109a92c7f220a3d59c6834e64aa9:v0.1.1',
      ],
    },
  ],
}
```
