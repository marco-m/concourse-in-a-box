# How To

1. Deploy the stack:
```
docker compose -f docker-compose.yml -f prometheus.yml up
```

2. Run the script
```
./script.sh
```

# Results

If two (or more) tasks lands on the same worker at the same time, it is a big.
