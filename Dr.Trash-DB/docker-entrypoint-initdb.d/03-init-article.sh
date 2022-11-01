#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "application"."trashcanCode" ("code") VALUES ('ddcd8c24-4fe4-4f87-b197-da65ab63f17f');

    INSERT INTO "application"."user"("kakaoId","name","thumbnail","point") VALUES
        ('1234567890','김철수','https://i.ibb.co/PmDHNbm/2022-07-28-9-10-53.png',0),
        ('0987654321','이영희','https://i.ibb.co/y83ZkYx/Kakao-Talk-20221031-230253693.jpg',300),
        ('1234567891','박철수','https://i.ibb.co/vqWWkTT/image.jpg',100),
        ('0987654322','최영희','https://i.ibb.co/0snpxxZ/images.jpg',200),
        ('0981233321','임영웅','https://i.ibb.co/pdKWBDS/5109431-agi-Laci-MHn-1659098198501.jpg',500);

    INSERT INTO "application"."article"("authorId", "title", "content", "viewCount") VALUES
        ('1','안녕하세요','안녕하세요. 가입 했습니다~ 다들 쓰레기 분리수거 잘해서 환경을 지켜봅시다!!',2),
        ('2','까다롭네요ㅠㅠ','쓰레기 분리수거 법이 은근 까다롭네요ㅠㅠ 너무 어려워요 그래도 닥터트래쉬 덕에 도움 많이 받았습니다~~',5),
        ('3','FAQ','FAQ 굉장히 도움 많이 되네요!!',10),
        ('3','여기 처음 가입했어요','가입가입냥냥',14),
        ('2','닥터트레시 신기해요!','넘나 신기',16),
        ('3','친하게지내요','서울 사시는 분!~',30),
        ('3','오오','멋져요',18),
        ('4','활발하게 커뮤 활동 할게요 ㅎㅎ','커뮤니티도 있어서 제 이야기 할 수 있어서 좋네요!! 글 많이 작성하겠습니당~~ㅎㅎ',110);
        
EOSQL