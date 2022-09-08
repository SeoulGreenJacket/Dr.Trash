#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE SCHEMA "$APPLICATION_SCHEMA" AUTHORIZATION postgres;

    CREATE TABLE "$APPLICATION_SCHEMA"."user" (
        "id" SERIAL,
        "kakaoId" BIGINT NOT NULL,
        "name" VARCHAR(32) NOT NULL,
        "thumbnail" VARCHAR(256) NOT NULL,
        "point" INTEGER NOT NULL,

        PRIMARY KEY ("id")
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
            ON DELETE SET NULL;
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."comment" (
        "id" SERIAL,
        "authorId" INTEGER,
        "articleId" INTEGER NOT NULL,
        "content" VARCHAR(1024) NOT NULL,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
        "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
        "likeCount" INTEGER NOT NULL DEFAULT 0,
        "hateCount" INTEGER NOT NULL DEFAULT 0,

        PRIMARY KEY ("id"),
        FOREIGN KEY ("authorId") REFERENCES "$APPLICATION_SCHEMA"."user"("id")
            ON DELETE SET NULL,
        FOREIGN KEY ("articleId") REFERENCES "$APPLICATION_SCHEMA"."article"("id")
            ON DELETE CASCADE
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."token" (
        "id" VARCHAR(64) NOT NULL,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("id")
    );
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE "$APPLICATION_SCHEMA"."trashcanCode" (
        "code" CHAR(36) NOT NULL,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("code")
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."trashcan" (
        "id" SERIAL,
        "code" CHAR(36) NOT NULL,
        "managerId" INTEGER,
        "name" VARCHAR(32),
        "phoneNumber" CHAR(13),
        "latitude" FLOAT,
        "longitude" FLOAT,
        "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
        "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("id"),
        FOREIGN KEY ("code") REFERENCES "$APPLICATION_SCHEMA"."trashcanCode"("code")
            ON DELETE NO ACTION,
        FOREIGN KEY ("managerId") REFERENCES "$APPLICATION_SCHEMA"."user"("id")
            ON DELETE CASCADE
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."trash" (
        "id" SERIAL,
        "userId" INTEGER NOT NULL,
        "trashcanId" INTEGER,
        "type" VARCHAR(32) NOT NULL,
        "at" TIMESTAMP NOT NULL DEFAULT NOW(),
        "ok" BOOLEAN NOT NULL DEFAULT FALSE,

        PRIMARY KEY ("id"),
        FOREIGN KEY ("userId") REFERENCES "$APPLICATION_SCHEMA"."user"("id")
            ON DELETE CASCADE,
        FOREIGN KEY ("trashcanId") REFERENCES "$APPLICATION_SCHEMA"."trashcan"("id")
            ON DELETE SET NULL
    );

    CREATE TABLE "$APPLICATION_SCHEMA"."trashcanUsage" (
        "id" SERIAL,
        "userId" INTEGER NOT NULL,
        "trashcanId" INTEGER,
        "open" BOOLEAN NOT NULL,
        "time" TIMESTAMP NOT NULL DEFAULT NOW(),

        PRIMARY KEY ("id"),
        FOREIGN KEY ("userId") REFERENCES "$APPLICATION_SCHEMA"."user"("id")
            ON DELETE CASCADE,
        FOREIGN KEY ("trashcanId") REFERENCES "$APPLICATION_SCHEMA"."trashcan"("id")
            ON DELETE SET NULL
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
        FOREIGN KEY ("userId") REFERENCES "$APPLICATION_SCHEMA"."user"("id")
            ON DELETE CASCADE,
        FOREIGN KEY ("achievementId") REFERENCES "$APPLICATION_SCHEMA"."achievement"("id")
            ON DELETE CASCADE
    );
EOSQL
