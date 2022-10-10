#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "$APPLICATION_SCHEMA"."achievement"("name", "description", "imageUri") VALUES
        ('Bachelor of Plastic', '플라스틱 학사', 'http://example.com/badges/bachelor-of-plastic.jpg'),
        ('Master of Plastic', '플라스틱 석사', 'http://example.com/badges/master-of-plastic.jpg'),
        ('Doctor of Plastic', '플라스틱 박사', 'http://example.com/badges/doctor-of-plastic.jpg'),
        ('Bachelor of Can', '캔 학사', 'http://example.com/badges/bachelor-of-can.jpg'),
        ('Master of Can', '캔 석사', 'http://example.com/badges/master-of-can.jpg'),
        ('Doctor of Can', '캔 박사', 'http://example.com/badges/doctor-of-can.jpg'),
        ('Bachelor of Paper', '종이 학사', 'http://example.com/badges/bachelor-of-paper.jpg'),
        ('Master of Paper', '종이 석사', 'http://example.com/badges/bachelor-of-paper.jpg'),
        ('Doctor of Paper', '종이 박사', 'http://example.com/badges/master-of-paper.jpg');
EOSQL
