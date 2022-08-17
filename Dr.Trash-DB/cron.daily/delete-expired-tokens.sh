#!/bin/bash
set -e

RESULT=$(
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    DELETE FROM "$APPLICATION_SCHEMA"."token" WHERE "createdAt" < NOW() - INTERVAL '$TOKEN_EXPIRATION';
EOSQL
)

echo "Deleted $(echo $RESULT | cut -d ' ' -f 2) expired tokens"
