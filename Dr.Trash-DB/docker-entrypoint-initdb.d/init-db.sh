#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE SCHEMA "$APPLICATION_SCHEMA" AUTHORIZATION postgres;

    CREATE TABLE "$APPLICATION_SCHEMA"."user" (
        "id" SERIAL,
        "kakaoId" INTEGER NOT NULL,
        "name" VARCHAR(32) NOT NULL,
        "thumbnail" VARCHAR(256) NOT NULL,
        "point" INTEGER NOT NULL,

        PRIMARY KEY ("id")
    );

        PRIMARY KEY (id)
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."trashcan" (
        "id" SERIAL,
        "managerId" INTEGER,
        "name" VARCHAR(32),
        "description" VARCHAR(256),
        "latitude" FLOAT,
        "longitude" FLOAT,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("id"),
        FOREIGN KEY ("managerId") REFERENCES "$APPLICATION_SCHEMA"."user"("id")
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."article" (
        "id" SERIAL,
        "authorId" INTEGER NOT NULL,
        "title" VARCHAR(32) NOT NULL,
        "content" VARCHAR(1024) NOT NULL,
        "likeCount" INTEGER NOT NULL DEFAULT 0,
        "viewCount" INTEGER NOT NULL DEFAULT 0,
        "hateCount" INTEGER NOT NULL DEFAULT 0,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
        "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("id"),
        FOREIGN KEY ("authorId") REFERENCES "$APPLICATION_SCHEMA"."user"("id")
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."comment" (
        "id" SERIAL,
        "authorId" INTEGER NOT NULL,
        "articleId" INTEGER NOT NULL,
        "content" VARCHAR(1024) NOT NULL,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
        "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
        "likeCount" INTEGER NOT NULL DEFAULT 0,
        "hateCount" INTEGER NOT NULL DEFAULT 0,

        PRIMARY KEY ("id"),
        FOREIGN KEY ("authorId") REFERENCES "$APPLICATION_SCHEMA"."user"("id"),
        FOREIGN KEY ("articleId") REFERENCES "$APPLICATION_SCHEMA"."article"("id")
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."achievement" (
        "id" SERIAL,
        "name" VARCHAR(32) NOT NULL,
        "description" VARCHAR(256) NOT NULL,
        "imageUri" VARCHAR(256) NOT NULL,

        PRIMARY KEY ("id")
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."achiever" (
        "userId" INTEGER NOT NULL,
        "achievementId" INTEGER NOT NULL,
        "achievedAt" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("userId", "achievementId"),
        FOREIGN KEY ("userId") REFERENCES "$APPLICATION_SCHEMA"."user"("id"),
        FOREIGN KEY ("achievementId") REFERENCES "$APPLICATION_SCHEMA"."achievement"("id")
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."token" (
        "id" VARCHAR(64) NOT NULL,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("id")
    );
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER "$APPLICATION_USERNAME" PASSWORD '$APPLICATION_PASSWORD';

    GRANT USAGE ON SCHEMA "$APPLICATION_SCHEMA" TO "$APPLICATION_USERNAME";
    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "$APPLICATION_SCHEMA" TO "$APPLICATION_USERNAME";
    GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA "$APPLICATION_SCHEMA" TO "$APPLICATION_USERNAME";

    CREATE ROLE "$DEVELOPER_USERNAME" WITH LOGIN PASSWORD '$DEVELOPER_PASSWORD';

    GRANT ALL PRIVILEGES ON SCHEMA "$APPLICATION_SCHEMA" TO "$DEVELOPER_USERNAME";
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA "$APPLICATION_SCHEMA" TO "$DEVELOPER_USERNAME";
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA "$APPLICATION_SCHEMA" TO "$DEVELOPER_USERNAME";
EOSQL
