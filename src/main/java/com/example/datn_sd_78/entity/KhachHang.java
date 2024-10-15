package com.example.datn_sd_78.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Khach_Hang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Họ tên không được để trống")
    @Column(name = "ho_Ten", nullable = false)
    private String hoTen;

    @Email(message = "Email không đúng định dạng")
    @NotBlank(message = "Email không được để trống")
    @Column(name = "email", nullable = false)
    private String email;

    @NotNull(message = "Trạng thái không được để trống")
    @Column(name = "trang_Thai", nullable = false)
    private Integer trangThai;

    @NotBlank(message = "Tài khoản không được để trống")
    @Size(min = 5, message = "Tài khoản phải có ít nhất 5 ký tự")
    @Column(name = "tai_Khoan", unique = true, nullable = false)
    private String taiKhoan;

    @NotBlank(message = "Mật khẩu không được để trống")
    @Size(min = 6, message = "Mật khẩu phải có ít nhất 6 ký tự")
    @Column(name = "mat_Khau", nullable = false)
    private String matKhau;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_Tao", nullable = false)
    private Date ngayTao;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_Sua")
    private Date ngaySua;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Size(max = 15, message = "Số điện thoại không quá 15 ký tự")
    @Column(name = "sdt", length = 15, nullable = false)
    private String sdt;

    @NotBlank(message = "Địa chỉ không được để trống")
    @Column(name = "dia_Chi", nullable = false)
    private String diaChi;
}
