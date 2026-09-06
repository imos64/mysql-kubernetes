# Architecture

Oracle MySQL Operator manages three Group Replication members and two MySQL Router instances. Hard anti-affinity distributes database members over three hosts.

```mermaid
flowchart LR
Client --> Router[MySQL Router x2]
Router --> Primary
Primary <-->|Group Replication| Member2
Primary <-->|Group Replication| Member3
Operator[MySQL Operator] --> Primary
Primary --> PVC1
Member2 --> PVC2
Member3 --> PVC3
```

## Failure domains

A majority of the three Group Replication members must remain connected. Router directs new connections after primary election; transactions in flight need application retries. Two Routers do not compensate for loss of database quorum.

Three pods on one physical host are a development topology, not independent failure domains. Use distinct workers and map placement to zones where your storage and application support it. A node-local PVC binds recovery to that node.

## Trust and data flow

Clients enter through ClusterIP services. Namespace-scoped NetworkPolicies limit workload ingress when enforced by the CNI. Operators need Kubernetes API access and admission-webhook reachability. Existing secrets are mounted or referenced at runtime; never place secret payloads in Helm values or IaC state intentionally.

## Capacity

Base and production resource/PVC requests are explicit in chart values. Benchmark your data volume, query mix and failover headroom. Leave enough capacity to recover a member while sustaining workload; do not treat requests as a sizing guarantee.
