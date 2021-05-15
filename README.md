# concourse-in-a-box

All-in-one [Concourse] CI/CD system based on Docker Compose, with Minio S3-compatible storage and HashiCorp Vault secret manager. This enables to:

1. Learn Concourse pipelines from scratch in a simple environment.
2. Troubleshoot production Concourse pipelines in a stand-alone environment.
3. Write Concourse pipelines that can be reused as-is in your production environment, since it comes with S3 and secret store.

# Status

NOT YET READY FOR USAGE

# Security considerations

This project is NOT adapted for production or networked use.

Among other non-production ready settings, it contains hard-coded secrets, stored in the git repo. For production use, all secrets must be regenerated and must not be stored in the git repo!

# What's in the box

* [Concourse] 7.2.0 web
* Concourse worker (platform: Linux)
* [PostgreSQL] 13.2 (needed by Concourse web)
* [Minio] XXX S3-compatible object storage. With this, you can learn writing real-world Concourse pipelines using the [concourse-s3-resource] without the need of setting up an AWS S3 (or any other cloud provider) account.
* [HashiCorp Vault] XXX secret and credential manager. With this, you can learn writing real-world Concourse pipelines following security and operations best practices. See also [Concourse credential management] for how Concourse uses Vault.

# Usage

## Common setup and teardown

* Download the images and start the containers:
  ```
  $ docker compose up
  ```
* When done, remember to stop the containers:
  ```
  $ docker compose stop
  ```
* If you want to also delete the persistent volumes, in order to delete the Concourse build history and the contents of the Minio S3 buckets:
  ```
  $ docker compose down
  ```

## Concourse setup

* Point your web browser to http://localhost:8080 and follow the instructions:
  * Download the `fly` command-line tool and put it in your $PATH.
  * Login to the web interface (credentials are in docker-compose.yml, `CONCOURSE_ADD_LOCAL_USER`)
* In another terminal, login with `fly` (will open the web browser to finish authentication):
  ```
  $ fly --target=ci login --concourse-url=http://localhost:8080 --open-browser
  ```
* You can use anything as the value for `--target`, it is an alias for the connection to the given Concourse with the given credentials (see file `$HOME/.flyrc`).

## Minio S3 setup

* The docker-compose file creates a bucket named `artifacts`
* Optional: point your browser to http://localhost:9000 and login (credentials are in docker-compose.yml file).
* Optional: follow [mc documentation] and install the command-line client `mc`.

## Vault setup

* WRITEME

# Concourse primer

Have a look at [Concourse incomplete primer](./doc/concourse-primer.md)

# Known issues

* The scheduling of Concourse 7.x is slow, it takes 5-10 seconds to decide what to do next. There are various opened tickets about this behavior.

# History and credits

This project builds upon what I learned in my previous approach, VM-based: [concourse-ci-formula](https://github.com/marco-m/concourse-ci-formula).

This project is just an humble collection of great open source software.




[concourse]: https://concourse-ci.org/
[concourse credential management]: https://concourse-ci.org/creds.html
[concourse-s3-resource]: https://github.com/concourse/s3-resource/
[minio]: https://min.io/
[mc documentation]: https://docs.min.io/minio/baremetal/reference/minio-cli/minio-mc.html
[HashiCorp Vault]: https://www.hashicorp.com/products/vault
[PostgreSQL]: https://www.postgresql.org/
