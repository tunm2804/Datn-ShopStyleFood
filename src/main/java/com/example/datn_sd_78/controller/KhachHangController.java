package com.example.datn_sd_78.controller;


import com.example.datn_sd_78.entity.KhachHang;
import com.example.datn_sd_78.repository.KhachHangRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.Optional;


@Controller
@RequestMapping("/khachhang")
public class KhachHangController {
    @Autowired
    KhachHangRepository khachHangRepository;

    @GetMapping("/list")
    public String getAllKhachHang(Model model,
                                  @RequestParam(defaultValue = "0") int page,
                                  @RequestParam(value = "searchTerm", required = false) String searchTerm) {
        int pageSize = 10;
        Pageable pageable = PageRequest.of(page, pageSize);
        Page<KhachHang> khachHangPage;

        if (searchTerm != null && !searchTerm.isEmpty()) {
            // Tìm kiếm khách hàng theo tên nếu searchTerm có giá trị
            khachHangPage = khachHangRepository.findByHoTenContainingIgnoreCase(searchTerm, pageable);

            // Nếu không tìm thấy kết quả, sử dụng trang hiện tại để giữ lại danh sách
            if (khachHangPage.getTotalElements() == 0) {
                // Trả về danh sách tất cả khách hàng để hiển thị
                khachHangPage = khachHangRepository.findAll(pageable);
            }
        } else {
            // Trả về danh sách khách hàng nếu không có từ khóa tìm kiếm
            khachHangPage = khachHangRepository.findAll(pageable);
        }

        model.addAttribute("khachHangs", khachHangPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", khachHangPage.getTotalPages());
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("searchTerm", searchTerm); // Để hiển thị lại giá trị searchTerm sau khi tìm kiếm

        return "khach-hang/index";
    }

    @GetMapping("/add")
    public String viewAdd(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "khach-hang/formkh";
    }

    @PostMapping("/add")
    public String add(@Valid @ModelAttribute("khachHang") KhachHang khachHang,
                      BindingResult result,
                      Model model) {
        // Kiểm tra số điện thoại đã tồn tại
        Optional<KhachHang> existingBySdt = khachHangRepository.findBySdt(khachHang.getSdt());
        if (existingBySdt.isPresent()) {
            result.rejectValue("sdt", "error.khachHang", "Số điện thoại đã tồn tại!");
        }

        // Kiểm tra tài khoản đã tồn tại
        Optional<KhachHang> existingByTaiKhoan = khachHangRepository.findByTaiKhoan(khachHang.getTaiKhoan());
        if (existingByTaiKhoan.isPresent()) {
            result.rejectValue("taiKhoan", "error.khachHang", "Tài khoản đã tồn tại!");
        }
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors()); // Thêm lỗi vào model
            return "khach-hang/formkh"; // Trả về trang tạo khách hàng nếu có lỗi
        }
        khachHang.setNgayTao(new Date());
        khachHangRepository.save(khachHang);
        return "redirect:/khachhang/list";
    }



    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        khachHangRepository.deleteById(id); // Xóa khách hàng theo ID
        redirectAttributes.addFlashAttribute("message", "Xóa khách hàng thành công!");
        return "redirect:/khachhang/list";
    }


    @GetMapping("/update/{id}")
    public String viewUpdate(@PathVariable Integer id, Model model) {
        // Tìm kiếm KhachHang theo ID
        KhachHang khachHang = khachHangRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid customer ID: " + id));
        model.addAttribute("khachHang", khachHang);
        return "khach-hang/updatekh";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Integer id,
                         @Valid @ModelAttribute("khachHang") KhachHang kh,
                         BindingResult result,
                         RedirectAttributes redirectAttributes) {

        // Kiểm tra nếu khách hàng với ID không tồn tại
        if (!khachHangRepository.existsById(id)) {
            return "redirect:/khachhang/list?error=notfound"; // Chuyển hướng nếu không tìm thấy
        }

        // Kiểm tra số điện thoại có trùng không
        Optional<KhachHang> existingBySdt = khachHangRepository.findBySdt(kh.getSdt());
        if (existingBySdt.isPresent() && !existingBySdt.get().getId().equals(id)) {
            result.rejectValue("sdt", "error.khachHang", "Số điện thoại đã tồn tại!");
        }

        // Kiểm tra tài khoản có trùng không
        Optional<KhachHang> existingByTaiKhoan = khachHangRepository.findByTaiKhoan(kh.getTaiKhoan());
        if (existingByTaiKhoan.isPresent() && !existingByTaiKhoan.get().getId().equals(id)) {
            result.rejectValue("taiKhoan", "error.khachHang", "Tài khoản đã tồn tại!");
        }

        // Nếu có lỗi validate, trả lại form cập nhật với thông báo lỗi
        if (result.hasErrors()) {
            return "khach-hang/updatekh"; // Trả về trang cập nhật nếu có lỗi
        }

        // Tìm kiếm khách hàng hiện tại
        KhachHang existingKhachHang = khachHangRepository.findById(id).orElse(null);
        if (existingKhachHang != null) {
            // Cập nhật thông tin mà không thay đổi ngày tạo
            existingKhachHang.setHoTen(kh.getHoTen());
            existingKhachHang.setEmail(kh.getEmail());
            existingKhachHang.setTrangThai(kh.getTrangThai());
            existingKhachHang.setTaiKhoan(kh.getTaiKhoan());
            existingKhachHang.setMatKhau(kh.getMatKhau());
            existingKhachHang.setSdt(kh.getSdt());
            existingKhachHang.setDiaChi(kh.getDiaChi());
            existingKhachHang.setNgaySua(new Date()); // Cập nhật ngày sửa

            // Lưu thông tin đã cập nhật
            khachHangRepository.save(existingKhachHang);
        }

        // Chuyển hướng đến danh sách
        return "redirect:/khachhang/list";
    }

}
