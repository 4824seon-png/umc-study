package com.umc.study.service;

import com.umc.study.repository.RentalRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class RentalService {

    private final RentalRepository rentalRepository;

    public void createRental(Map<String, Object> body) {
        // 지금은 전달만 합니다.
        // (대여 한도 초과, 이미 대여 중인 책 등의 규칙이 생기면 여기에 추가)
        rentalRepository.save(body);
    }
}