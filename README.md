# concourse-in-a-box

All-in-one Concourse CI/CD system based on Docker Compose with Minio S3-compatible storage and HashiCorp Vault secret manager.

# Introduction

This is a one-stop solution that allows to:

1. Learn Concourse pipelines from scratch in a simple, stand-alone environment.
2. Troubleshoot production Concourse pipelines in a simple, stand-alone environment.
3. Write Concourse pipelines that can be reused as-is in your production environment, since it comes with S3 and secret ((parameters)).

# Security

This project is NOT adapted for production or networked use.

It is adapted to test drive, learn and troubleshoot a Concourse system and its pipelines. Among other non-production ready settings, it contains hard-coded secrets, stored in the git repo. For production use, all secrets must be regenerated and must not be stored in the git repo!

# Origin

This project builds upon what I learned in my previous approach, VM-based: [concourse-ci-formula]https://github.com/marco-m/concourse-ci-formula.

# Credits

This project is just an humble collection of great open source software.
