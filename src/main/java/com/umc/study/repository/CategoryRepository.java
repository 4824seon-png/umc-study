package com.umc.study.repository;

import com.umc.study.domain.Category;
import org.springframework.data.jpa.repository.JpaRepository;

// ⑫
public interface CategoryRepository extends JpaRepository<Category, Long> {
    // ⑬
}