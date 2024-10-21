package com.example.datn_sd_78.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.stereotype.Controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Entity
@Data
@Table(name = "SanPham")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    @Column(name = "ma", length = 255, nullable = false, unique = true)
    private String ma;

    @Column(name = "ten", length = 255, nullable = false)
    private String ten;

    @Column(name = "trangThai", nullable = false)
    private Integer trangThai;

    @Column(name = "ngayTao", nullable = false)
    private Date ngayTao;

    @Column(name = "ngaySua")
    private Timestamp ngaySua;

    @Column(name = "anh")
    private String anh;

    @Column(name = "soLuong")
    private int soLuong;

    @Column(name = "thuongHieu")
    private String thuongHieu;

    @Column(name = "giaBan", precision = 18, scale = 2, nullable = false)
    private BigDecimal giaBan;

    @Column(name = "moTa", length = 3000, nullable = false)
    private String moTa;

    @Column(name = "gioiTinh", nullable = false)
    private Boolean gioiTinh;

    @ManyToOne
    @JoinColumn(name = "id_Kieu_dang")
    private KieuDang kieuDang;

    @ManyToOne
    @JoinColumn(name = "id_chat_lieu")
    private ChatLieu chatLieu;

    @ManyToOne
    @JoinColumn(name = "id_danh_muc_san_pham")
    private DanhMuc danhMuc;

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL)
    private List<SanPhamChiTiet> chiTietSanPham;

//    @ManyToOne
//
//    private List<Anh> anhs;

}

