package com.example.datn_sd_78.Repo;

import com.example.datn_sd_78.entity.SanPham;
import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SanPhamRepository extends JpaRepository<SanPham, Integer> {
    List<SanPham> findByTenContaining(String ten); // Tìm kiếm sản phẩm theo tên
}
