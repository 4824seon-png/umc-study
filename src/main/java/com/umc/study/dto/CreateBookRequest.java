package com.umc.study.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

// ⑯
public record CreateBookRequest(
        // ⑰
        @NotNull(message = "카테고리 ID는 필수입니다.")
        Long categoryId,

        // ⑱
        @NotBlank(message = "제목은 비어 있을 수 없습니다.")
        // ⑲
        @Size(max = 100, message = "제목은 100자 이하여야 합니다.")
        String title,

        // ⑳
        String description
) {
}