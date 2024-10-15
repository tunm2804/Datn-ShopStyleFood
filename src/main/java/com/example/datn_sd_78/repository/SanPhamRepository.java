package com.example.datn_sd_78.repository;

import com.example.datn_sd_78.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
    List<SanPham> findByTenContaining(String ten); // Tìm kiếm sản phẩm theo tên
}
