# Source provenance

Maintainer: [imos64](https://github.com/imos64). Integration package version: 1.0.0. Sources reviewed 2026-09-06.

[Upstream project](https://github.com/mysql/mysql-operator) · [Official documentation](https://dev.mysql.com/doc/mysql-operator/en/)

Upstream Helm chart `mysql-operator` is pinned to `2.3.0` from `https://mysql.github.io/mysql-operator`. Chart dependencies are vendored and locked; `helm dependency build` reproduces the recorded version.

Kubernetes CRD validation schema is the transitive definition subset of the official [Kubernetes v1.34.0 OpenAPI specification](https://github.com/kubernetes/kubernetes/blob/v1.34.0/api/openapi-spec/swagger.json), Apache-2.0. Upstream chart archives include their source templates and original license files where supplied. Container image licensing remains upstream; this deployment license does not relicense those applications.

Image versions are explicit in values or locked upstream charts. Tags are version-pinned, not guaranteed immutable; mirror and pin approved image digests for your production supply chain. Review chart, image, plugin and operator updates as one compatible change.

| Chart archive | SHA-256 |
| --- | --- |
| `operator/charts/mysql-operator-2.3.0.tgz` | `709511cd712320aa9d55138dd7b27f4851694da179329f2078fb9edcac8bab9f` |

MySQL Server is pinned to 8.4.12; Router is explicitly pinned to the operator release default 26.7.0. The registry did not publish community-router:8.4.12, so allowing the Router tag to inherit the server version causes ImagePullBackOff. Both configured image tags were checked against Oracle Container Registry.
