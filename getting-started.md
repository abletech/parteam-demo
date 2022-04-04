# Getting Started

1. `hasura init {{name}}`
2. `cd {{name}}`
3. Create docker-compose file
4. `docker-compose up`
5. `export HASURA_GRAPHQL_ADMIN_SECRET='myadminsecretkey'`
6. `hasura console`
7. Data > Connect database 
8. Fill out details, use `PG_DATABASE_URL` as the env var - should connect the database, one schema called "public"
9. Start creating your tables (these will create you migrations):

- Party Types
- Parties
- Relationship Types
- Relationship
- Teams
- Resources
- Team Subjects
  
10. Add some relationships

- Relationships
  - from_party (O)
  - to_party (O)
- Teams
  - subjects (A)
  - resources (A)
- Subjects
  - team (O)
  - party (O)
- Resources
  - team (O)
- Parties (might need renaming)
  - from_party_relationships (A)
  - to_party_relationships (A)
  - team_subjects (A)

11. Populate some data - insert some records
12. Create a seed file from the current data

```bash
hasura seed create initial_seed_data --from-table parties --from-table party_types --from-table relationship_types --from-table relationships --from-table resources --from-table subjects --from-table teams
```

```bash
hasura seed apply
```

