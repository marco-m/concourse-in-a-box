# How To

1. Deploy the stack:
```
docker compose -f docker-compose.yml -f prometheus.yml up
```

2. Generate a big file
`dd bs=1024 count=1048576 </dev/urandom > bigfile-1`

3. Upload the file to minio
  - connect to minio http://localhost:9000 with user minio and password in .env
  - upload bigfile-1 to concourse bucket

4. Set the pipeline and trigger job1
```
$ fly --target=ci login --concourse-url=http://localhost:8080 --open-browser
$ fly -t ci sp -p two-workers-with-flock -c pipeline.yml
$ fly -t ci up -p two-workers-with-flock
$ fly -t ci tj -j two-workers-with-flock/job1
```

5. Look at the pipeline, when job1/use-big-file is streaming the file, trigger job2

# Results

If two (or more) tasks lands on the same worker at the same time, it is a big.
