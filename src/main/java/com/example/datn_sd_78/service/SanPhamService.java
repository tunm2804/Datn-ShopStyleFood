package com.example.datn_sd_78.service;


import com.example.datn_sd_78.entity.SanPham;
import com.example.datn_sd_78.entity.SanPhamChiTiet;
import com.example.datn_sd_78.repository.ChiTietSanPhamRepository;
import com.example.datn_sd_78.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SanPhamService {
    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private ChiTietSanPhamRepository sanPhamChiTietRepository;

    private List<SanPham> list = new ArrayList<>();

    public SanPham findById(int id) {
        return sanPhamRepository.findById(id).orElse(null);
    }

    public SanPhamChiTiet findByIdCTSP(int id) {
        return sanPhamChiTietRepository.findById(id)
                .orElse(null); // Trả về sản phẩm chi tiết nếu tìm thấy, nếu không trả về null
    }

}
