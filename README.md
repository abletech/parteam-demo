# Parteams Demo App

A demo app of a hybrid "party" and "teams" service

## Requirements

- [Hasura CLI](https://hasura.io/docs/latest/graphql/core/hasura-cli/index/)
- [Docker](https://www.docker.com/)

## Getting started

Run the following to get the `graphql-engine` and `postgres` containers started:

```bash
docker-compose up
```

## Following along

You can follow the [corresponding blog article](https://abletech.nz/article/building-a-party-teams-service-in-less-than-a-day-using-hasura/) to get the metadata/migrations/seeds set up yourself. Alternatively, see the below section to apply the included migrations and metadata.

## Apply migrations and metadata

If you don't want to follow the blog article, or just want to get the "Parteams" service up and running, you can run the following commands:

1. Apply the metadata - note: this will result in inconsistencies whilst the database doesn't have the correct tables set up (we need to apply metadata first so Hasura knows where to look for the database).

```bash
hasura metadata apply
```

2. Apply the migrations - this will create the tables, indexes and foreign keys.

```bash
hasura migrate apply
```

3. Reload the metadata - this should hopefully remove the inconsistencies created in 1) now that our tables etc. exist.

```bash
hasura metadata reload
```

4. Apply the seeds - this will create some mock data that you can query on:

```bash
hasura seed apply
```
