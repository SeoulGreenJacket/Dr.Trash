#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "application"."achievement"("name", "description", "imageUri") VALUES
        ('어설프게 쓰레기 버리기', '쓰레기를 처음 버리기', 'http://storage.drtrash.seheon.codes/images/forest.png'),
        ('능숙하게 쓰레기 버리기', '쓰레기를 10개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/forest.png'),
        ('눈감고 쓰레기 버리기', '쓰레기를 100개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/forest.png'),
        ('이게 플라스틱인가?', '플라스틱을 처음 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이게 플라스틱이군', '플라스틱을 10개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이건 플라스틱이지', '플라스틱을 100개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이게 캔인가', '캔을 처음 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이게 캔이군', '캔을 10개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이건 캔이지', '캔을 100개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이게 페트병인가', '페트병을 처음 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이게 페트병이군', '페트병을 10개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('이건 페트병이지', '페트병을 100개 이상 버리기', 'http://storage.drtrash.seheon.codes/images/smile.png'),
        ('전국 대표 청소부', '3등 달성하기', 'http://storage.drtrash.seheon.codes/images/award.png'),
        ('지역 대표 청소부', '10등 달성하기', 'http://storage.drtrash.seheon.codes/images/award.png'),
        ('우리집 대표 청소부', '30등 달성하기', 'http://storage.drtrash.seheon.codes/images/award.png'),
        ('쓰레기 학사', '100점 이상 획득하기', 'http://storage.drtrash.seheon.codes/images/score100.png'),
        ('쓰레기 석사', '1000점 이상 획득하기', 'http://storage.drtrash.seheon.codes/images/score100.png'),
        ('쓰레기 박사', '10000점 이상 획득하기', 'http://storage.drtrash.seheon.codes/images/score100.png'),
        ('깨끗한 집이 좋아', '쓰레기통을 5개 이상 설치하기', 'http://storage.drtrash.seheon.codes/images/trashcan.png'),
        ('깨끗한 도시가 좋아', '쓰레기통을 10개 이상 설치하기', 'http://storage.drtrash.seheon.codes/images/trashcan.png'),
        ('깨끗한 나라가 좋아', '쓰레기통을 50개 이상 설치하기', 'http://storage.drtrash.seheon.codes/images/trashcan.png');
EOSQL
