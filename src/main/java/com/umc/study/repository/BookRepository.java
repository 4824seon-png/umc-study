package com.umc.study.repository;

import com.umc.study.domain.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// ⑭
public interface BookRepository extends JpaRepository<Book, Long> {

    // ⑮
    List<Book> findAllByOrderByBookIdDesc();
}