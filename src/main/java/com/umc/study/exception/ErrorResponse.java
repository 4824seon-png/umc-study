package com.umc.study.exception;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.Map;

// Ⓒ
@JsonInclude(JsonInclude.Include.NON_NULL)
public record ErrorResponse(
        String code,
        String message,
        Map<String, String> errors
) {
    // Ⓓ
    public static ErrorResponse of(String code, String message) {
        return new ErrorResponse(code, message, null);
    }

    public static ErrorResponse of(String code, String message, Map<String, String> errors) {
        return new ErrorResponse(code, message, errors);
    }
}