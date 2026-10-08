package com.umc.study.dto;

import com.umc.study.domain.Book;

// ㉑
public record BookResponse(
        Long bookId,
        String title,
        String description,
        // ㉒
        String categoryName,
        Boolean isAvailable
) {
    // ㉓
    public static BookResponse from(Book book) {
        return new BookResponse(
                book.getBookId(),
                book.getTitle(),
                book.getDescription(),
                // ㉔
                book.getCategory().getName(),
                book.getIsAvailable()
        );
    }
}