-- ============================================================
-- 00_create_database.sql
-- 실습용 DB(study)를 생성합니다. 초기화가 필요할 때도 이 파일부터 다시 실행합니다.
-- 실행 순서: 00_create_database.sql -> 01_schema.sql -> 02_seed.sql
-- ⚠ study DB를 통째로 지우고 새로 만듭니다. (2주차 mydb 등 다른 DB에는 영향 없음)
-- ============================================================

DROP DATABASE IF EXISTS study;
CREATE DATABASE study DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
