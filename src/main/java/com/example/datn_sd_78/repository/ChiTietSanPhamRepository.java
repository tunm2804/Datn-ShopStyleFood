package com.example.datn_sd_78.Repo;

import com.example.datn_sd_78.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChiTietSanPhamRepository extends JpaRepository<SanPhamChiTiet, Integer> {
    List<SanPhamChiTiet> findBySanPhamId(Integer id); // Sử dụng tên thuộc tính trong entity

//    List<SanPhamChiTiet> finBykeyword(String keyword);
}
