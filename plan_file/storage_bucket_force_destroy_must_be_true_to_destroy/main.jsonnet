// A lint file of lintnet.
// https://lintnet.github.io/
// https://developer.hashicorp.com/terraform/internals/json-format
function(param) [
  {
    name: "Destroyed GCS bucket's force_destroy must be true",
    location: {
      address: resource.address,
    },
  }
  for resource in param.data.value.resource_changes
  if resource.type == 'google_storage_bucket' &&
      std.contains(resource.change.actions, 'delete') &&
      resource.change.before != null &&
      !std.get(resource.change.before, 'force_destroy', false)
]
