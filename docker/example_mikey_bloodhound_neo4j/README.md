COPIED FROM <https://github.com/SpecterOps/BloodHound/tree/main/examples/docker-compose>

See `./Makefile` and try to run targets. i.e.:

    make all

## Cool commands

```bash
# start the docker compose deployment, and attach stdout to current terminal. CTRL-C will stop the deployment gracefully.
docker compose up

# start dat shit detached from reality, yo :3c
docker compose up -d

# see logs for all 3 containers.
docker compose logs

# see logs for all 3 containers, and follow all 3 stdout streams. CTRL-C will just close the logs.
docker compose logs -f

# see the status of all 3 running containers.
docker compose ps

# see the status of every container.
docker ps

# see logs for 1 specific container.
# You can use the name or id
# but here's the thing, the id changes all the time
# so use the name

docker logs example_mikey_bloodhound_neo4j-bloodhound-1


```

## Kill

```bash
docker compose down

docker volume ls

docker volume rm example_mikey_bloodhound_neo4j_neo4j-data

docker volume rm example_mikey_bloodhound_neo4j_postgres-data

```

## run again
```bash 
docker compose up -d
docker compose logs -f

```

# generic password
# found in stdout
# add a bang when you find it



# Open in Terminal and run this

# BloodHound