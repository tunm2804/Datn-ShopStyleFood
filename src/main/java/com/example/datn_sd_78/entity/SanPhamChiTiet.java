package com.example.datn_sd_78.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "ChiTietSanPham")
public class SanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "qrcode")
    private String qrcode;

    @ManyToOne
    @JoinColumn(name = "idsanpham")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "idmausac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "idsize")
    private Size size;
}
