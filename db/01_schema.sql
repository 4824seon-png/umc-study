-- ============================================================
-- 01_schema.sql
-- 온라인 도서 대여 관리 시스템 기준 ERD 테이블 (UMC 2주차 워크북 제공)
-- 관계: users 1:N rental, category 1:N book, book N:M tag(book_tag),
--       users N:M book(book_like), users 1:N notification
-- 부모 테이블(users, category, tag)부터 생성해야 FK를 걸 수 있습니다.
-- ============================================================

USE study;

CREATE TABLE users (
    user_id  BIGINT PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(30) NOT NULL
);

CREATE TABLE category (
    category_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50) NOT NULL
);

CREATE TABLE book (
    book_id      BIGINT PRIMARY KEY AUTO_INCREMENT,
    category_id  BIGINT NOT NULL,
    title        VARCHAR(100) NOT NULL,
    description  TEXT,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

CREATE TABLE rental (
    rental_id   BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id     BIGINT NOT NULL,
    book_id     BIGINT NOT NULL,
    rented_at   DATETIME NOT NULL,
    due_at      DATETIME NOT NULL,
    returned_at DATETIME NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id)
);

CREATE TABLE tag (
    tag_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name   VARCHAR(30) NOT NULL
);

CREATE TABLE book_tag (
    book_id BIGINT,
    tag_id  BIGINT,
    PRIMARY KEY (book_id, tag_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id),
    FOREIGN KEY (tag_id) REFERENCES tag (tag_id)
);

CREATE TABLE book_like (
    user_id BIGINT,
    book_id BIGINT,
    PRIMARY KEY (user_id, book_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id)
);

CREATE TABLE notification (
    notification_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id         BIGINT NOT NULL,
    type            VARCHAR(30) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
