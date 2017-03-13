#!/bin/bash
set -e

psql -v --username "$POSTGRES_USER" <<-EOSQL
  CREATE DATABASE osis_backend_dev;
  CREATE DATABASE osis_front_dev;
  GRANT ALL PRIVILEGES ON DATABASE osis_backend_dev TO ${POSTGRES_USER};
  GRANT ALL PRIVILEGES ON DATABASE osis_front_dev TO ${POSTGRES_USER};
EOSQL
