# Environment integration

See [configuration](../docs/configuration.md) for existing-secret keys and values overrides, and [operations](../docs/operations.md) for the application-specific backup and restore procedure. Examples must be adapted to your namespace, storage, identities and recovery objectives before use. Never commit generated credentials.

`backup-values.yaml` is an optional Helm overlay, not enabled by the default profiles. Replace the bucket, region and credential references, validate against the pinned operator, and run a real restore drill. Keep production secrets out of values files.
