# Temporal development Docker image

This is a Docker image for running `temporal server start-dev` and includes a compatible version of `tctl`.

## Docker compose

```yaml
  temporal:
    image: bmorton/temporal-dev:v0.10.3
    ports:
      - "7233:7233"
    command:
      # Metrics aren't exposed by default
      - --metrics-port=9233
      # Database is ephemeral by default
      - --db-filename=/data/temporalite.db
    volumes:
      - temporal:/data
```
