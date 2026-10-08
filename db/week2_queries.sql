USE study;

-- ------------------------------------------------------------
-- 미션 1. 문학 카테고리의 대여 가능한 도서를 최신순으로 10개 조회
--   결과: 책 제목, 설명, 카테고리 이름
--   테이블: book, category / 관계: book -> category
--   조건: 카테고리 이름 = 문학, 대여 가능 / 정렬·범위: book_id DESC, 10개
-- ------------------------------------------------------------
SELECT b.title, b.description, c.name AS category_name
FROM book b
JOIN category c ON b.category_id = c.category_id
WHERE c.name = '문학'
  AND b.is_available = TRUE
ORDER BY b.book_id DESC
LIMIT 10;

-- ------------------------------------------------------------
-- 미션 2. 특정 사용자가 아직 반납하지 않은 책을 반납 예정일 순으로 조회
--   결과: 책 제목, 대여일, 반납 예정일
--   테이블: rental, book / 관계: rental -> book
--   조건: 특정 user_id, returned_at IS NULL / 정렬: due_at ASC
-- ------------------------------------------------------------
SELECT b.title, r.rented_at, r.due_at
FROM rental r
JOIN book b ON r.book_id = b.book_id
where r.user_id = 1
and r.returned_at is null
order by r.due_at asc;

-- ------------------------------------------------------------
-- 미션 3. 특정 책의 태그 목록과 특정 사용자의 좋아요 여부 조회
--   결과: 책 제목, 태그 이름, 좋아요 여부
--   테이블: book, book_tag, tag, book_like
--   관계: book -> book_tag -> tag / book -> book_like
--   조건: 선택한 book_id, 현재 user_id
-- ------------------------------------------------------------

select b.title, t.name as tag_name, IF(bl.user_id is not null, 'O', 'X') AS is_liked
-- 좋아요 행이 있으면 o, 없으면 x
from book b -- 기준테이블
join book_tag bt ON b.book_id = bt.book_id -- book과 tag n:m 관계임으로 book_tag를 거친다
JOIN tag t ON bt.tag_id = t.tag_id

LEFT JOIN book_like bl ON b.book_id = bl.book_id AND bl.user_id = 1
-- 좋아요를 누르지 않으면 행이 없음으로 leftjoin으로 책, 태그 행은 남기고 빈칸은 null로
WHERE b.book_id = 1;


