package com.example.datn_sd_78.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Size")
public class Size {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private String id;

    @Column(name = "ten", nullable = false, length = 255)
    private String ten;
}
