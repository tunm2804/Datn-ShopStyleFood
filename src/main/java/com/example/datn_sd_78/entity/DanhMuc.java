package com.example.datn_sd_78.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "DanhMuc")
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private String id;

    @Column(name = "ten", nullable = false, length = 255)
    private String ten;

    @Column(name = "trangthai", nullable = false)
    private Integer trangthai;

    @Column(name = "ngay_tao", nullable = false)
    private LocalDate ngayTao;

    @Column(name = "ngay_sua")
    private LocalDate ngaySua;
}
