# storage_bucket_force_destroy_must_be_true_to_destroy

Destroyed GCS buckets' [force_destroy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket#force_destroy) must be `true`.

e.g.

```tf
resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "EU"
  # force_destroy = true
}
```

## Why?

To destroy a GCS bucket having some objects, `force_destroy` is required.
Otherwise, `terraform apply` fails.

## How to fix

Before destroying a GCS bucket, you should set `force_destroy` to `true` and run `terraform apply`.
Or you can also edit Terraform State on your own risk and change `force_destroy` to `true`.

```tf
resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "EU"
  force_destroy = true
}
```

## Usage

```jsonnet
function(param) {
  targets: [
    {
      data_files: [
        '**/tfplan.json',
      ],
      modules: [
        'github_archive/github.com/lintnet-modules/terraform-google/plan_file/storage_bucket_force_destroy_must_be_true_to_destroy/main.jsonnet@ecb6742573c7109a92c7f220a3d59c6834e64aa9:v0.1.1',
      ],
    },
  ],
}
```

## Config

Nothing.
