package com.example.datn_sd_78.repository;


import com.example.datn_sd_78.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {
    Page<KhachHang> findByHoTenContainingIgnoreCase(String hoTen, Pageable pageable);

    // Tìm khách hàng theo số điện thoại
    Optional<KhachHang> findBySdt(String sdt);

    // Tìm khách hàng theo tài khoản
    Optional<KhachHang> findByTaiKhoan(String taiKhoan);
}
