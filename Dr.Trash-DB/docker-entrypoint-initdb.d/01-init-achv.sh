#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "application"."achievement"("name", "description", "imageUri") VALUES
        ('지구를 위한 한걸음', '쓰레기를 처음 버리기', 'http://storage.drtrash.seheon.codes/images/forest.png'),
        ('전국 대표 청소부', '3등 달성하기', 'http://storage.drtrash.seheon.codes/images/award.png'),
        ('쓰레기 100점', '100점 이상 획득하기', 'http://storage.drtrash.seheon.codes/images/score100.png'),
        ('깨끗한 곳이 좋아', '쓰레기통을 처음 등록하기', 'http://storage.drtrash.seheon.codes/images/trashcan.png');
EOSQL
