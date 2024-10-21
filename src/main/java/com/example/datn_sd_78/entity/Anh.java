package com.example.datn_sd_78.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Anh")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Anh {
    @Id
    private Integer id;

    @Column(name = "ten")
    private String ten;

    @ManyToOne
    @JoinColumn(name = "san_pham_id")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "mau_sac_id")
    private MauSac mauSac;
}
