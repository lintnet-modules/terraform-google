# terraform-google

lintnet Module for Terraform Google Provider

## Rules

- [hcl/forbid_provider_custom_endpoint](hcl/forbid_provider_custom_endpoint): Forbid Google Provider's custom endpoints
- [plan_file/storage_bucket_force_destroy_must_be_true_to_destroy](plan_file/storage_bucket_force_destroy_must_be_true_to_destroy): Destroyed GCS buckets' [force_destroy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket#force_destroy) must be `true`.

## LICENSE

[MIT](LICENSE)
