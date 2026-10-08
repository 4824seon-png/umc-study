-- ============================================================
-- 02_seed.sql
-- 공통 더미 데이터 (UMC 2주차 워크북 제공)
-- FK 순서: users, category -> book -> rental / tag -> book_tag / book_like
-- notification 더미 데이터는 워크북에 없으므로 비어 있는 것이 정상입니다.
-- ============================================================

USE study;

INSERT INTO users (nickname) VALUES ('민서'), ('수현');

INSERT INTO category (name) VALUES ('문학'), ('과학');

INSERT INTO book (category_id, title, description, is_available) VALUES
    (1, '달빛 도서관', '소설', TRUE),
    (1, '겨울의 편지', '에세이', FALSE),
    (2, '우주를 읽는 법', '과학 교양', TRUE);

INSERT INTO rental (user_id, book_id, rented_at, due_at, returned_at) VALUES
    (1, 2, '2026-08-10 10:00:00', '2026-08-17 10:00:00', NULL),
    (2, 1, '2026-08-01 10:00:00', '2026-08-08 10:00:00', '2026-08-07 15:00:00');

INSERT INTO tag (name) VALUES ('소설'), ('추천'), ('과학');

INSERT INTO book_tag (book_id, tag_id) VALUES (1, 1), (1, 2), (3, 3);

INSERT INTO book_like (user_id, book_id) VALUES (1, 1), (1, 3);

-- 확인용
SELECT 'users' AS tbl, COUNT(*) AS cnt FROM users
UNION ALL SELECT 'category', COUNT(*) FROM category
UNION ALL SELECT 'book', COUNT(*) FROM book
UNION ALL SELECT 'rental', COUNT(*) FROM rental
UNION ALL SELECT 'tag', COUNT(*) FROM tag
UNION ALL SELECT 'book_tag', COUNT(*) FROM book_tag
UNION ALL SELECT 'book_like', COUNT(*) FROM book_like
UNION ALL SELECT 'notification', COUNT(*) FROM notification;
-- 기대값: users 2, category 2, book 3, rental 2, tag 3, book_tag 3, book_like 2, notification 0
