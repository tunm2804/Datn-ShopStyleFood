package com.demo.entity;
import jakarta.persistence.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "nhan_vien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer gioi_tinh;
    private String ten_nhan_vien;
    private String ma_nhan_vien;
    private String dia_chi;
    private String email;
    private String cccd;
    private Integer trang_thai;
    private String quoc_tinh;
    private String so_dien_thoai;
    @NotBlank(message = "Mật khẩu không được để trống")
    @Size(min = 6, message = "Mật khẩu phải có ít nhất 6 ký tự")
    @Column(name = "mat_khau", nullable = false)
    private String matKhau;
    private String tai_khoan;
    private Date ngay_tao;
    private Date ngay_sua;
    @ManyToOne
    @JoinColumn(name = "id_chuc_vu")
    ChucVu chucVu;
}
