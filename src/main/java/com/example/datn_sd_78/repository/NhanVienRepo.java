package com.example.datn_sd_78.repository;

import com.example.datn_sd_78.entity.NhanVien;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface NhanVienRepo extends JpaRepository<NhanVien, Integer> {

    @Query("SELECT nv FROM NhanVien nv WHERE LOWER(nv.ten_nhan_vien) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR nv.so_dien_thoai LIKE CONCAT('%', :keyword, '%')")
    Page<NhanVien> searchByNameOrPhone(@Param("keyword") String keyword, Pageable pageable);
}
