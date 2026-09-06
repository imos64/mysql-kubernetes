# Runtime evidence — 2026-09-06

The final base chart was installed into a fresh namespace in an isolated three-worker kind cluster (Kubernetes 1.36.1), using Oracle MySQL Operator 26.7.0-2.3.0, Server 8.4.12 and explicitly pinned Router 26.7.0. All three Group Replication members reported ONLINE and both Routers became available. A TLS-required client connected through the Router Service on port 6446, created a table, inserted/read a marker, and confirmed three ONLINE replication members.

The database anti-affinity excludes Router pods, allowing both tiers to use the same three workers. The server and Router image versions are deliberately independent because the registry lacks a Router 8.4.12 tag.

This checks fresh installation, quorum membership and the Router client path. It does not prove primary failover, application retry behavior, CA identity verification with site-issued certificates, performance or backup restore. NetworkPolicy enforcement was not separately tested.
