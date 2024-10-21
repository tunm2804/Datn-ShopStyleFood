package com.demo.controller;

import com.demo.entity.ChucVu;
import com.demo.entity.NhanVien;
import com.demo.repo.ChucVuRepo;
import com.demo.repo.NhanVienRepo;
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
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/nhan-vien")
public class NhanVienController {

    @Autowired
    NhanVienRepo nhanVienRepo;

    @Autowired
    ChucVuRepo chucVuRepo;

    @ModelAttribute("dsChucVu")
    public List<ChucVu> getDsLoaiPhong() {
        return chucVuRepo.findAll();
    }

    @GetMapping("/hien-thi")
    public String hienThi(@RequestParam(name = "page", defaultValue = "0") int page,
                          @RequestParam(required = false) String keyword, Model model) {
        Pageable pageable = PageRequest.of(page, 5); // Set page size to 5
        Page<NhanVien> nhanVienPage;

        if (keyword != null && !keyword.isEmpty()) {
            nhanVienPage = nhanVienRepo.searchByNameOrPhone(keyword.toLowerCase(), pageable);
        } else {
            nhanVienPage = nhanVienRepo.findAll(pageable); // No search, get all employees
        }

        model.addAttribute("nhanvien", new NhanVien());
        model.addAttribute("list", nhanVienPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", nhanVienPage.getTotalPages());
        model.addAttribute("keyword", keyword); // Preserve the keyword
        return "nhanvien/index"; // Return the JSP page
    }

    @GetMapping("/them")
    public String showAddEmployeeForm(Model model) {
        model.addAttribute("nhanVien", new NhanVien());
        return "nhanvien/add"; // Return the JSP page for adding an employee
    }

    @PostMapping("/them")
    public String addEmployee(@Valid @ModelAttribute NhanVien nhanVien, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "nhanvien/add"; // Return to the form if there are validation errors
        }

        // Set the creation date
        nhanVien.setNgay_tao(new Date());
        nhanVienRepo.save(nhanVien); // Save the new employee
        return "redirect:/nhan-vien/hien-thi"; // Redirect to the list page after adding
    }

    @GetMapping("/xoa/{id}")
    public String deleteNhanVien(@PathVariable Integer id) {
        nhanVienRepo.deleteById(id);
        return "redirect:/nhan-vien/hien-thi"; // Redirect to the list page after deleting
    }

    @GetMapping("/detail/{id}")
    public String viewDetail(@PathVariable Integer id, Model model) {
        NhanVien nhanVien = nhanVienRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy nhân viên với ID: " + id));
        model.addAttribute("nhanVien", nhanVien);
        return "nhanvien/detail"; // Return detail view
    }

    @GetMapping("/update/{id}")
    public String viewUpdate(@PathVariable Integer id, Model model) {
        NhanVien nhanVien = nhanVienRepo.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid employee ID: " + id));
        model.addAttribute("nv", nhanVien);
        return "nhanvien/update"; // Return the update form view
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Integer id,
                         @Valid @ModelAttribute("nv") NhanVien nv,
                         BindingResult result,
                         RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "nhanvien/update"; // Return to the form if validation fails
        }

        Optional<NhanVien> optionalNhanVien = nhanVienRepo.findById(id);

        if (optionalNhanVien.isPresent()) {
            NhanVien existingNhanVien = optionalNhanVien.get();

            // Update fields here
            existingNhanVien.setTen_nhan_vien(nv.getTen_nhan_vien());
            existingNhanVien.setGioi_tinh(nv.getGioi_tinh());
            existingNhanVien.setChucVu(nv.getChucVu());
            existingNhanVien.setTai_khoan(nv.getTai_khoan());
            existingNhanVien.setMatKhau(nv.getMatKhau());
            existingNhanVien.setTrang_thai(nv.getTrang_thai());
            existingNhanVien.setSo_dien_thoai(nv.getSo_dien_thoai());
            existingNhanVien.setDia_chi(nv.getDia_chi());
            existingNhanVien.setEmail(nv.getEmail());

            // Save updated employee
            nhanVienRepo.save(existingNhanVien);

            redirectAttributes.addFlashAttribute("message", "Nhân viên đã được cập nhật thành công!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Không tìm thấy nhân viên với ID: " + id);
        }

        return "redirect:/nhan-vien/hien-thi";
    }
}
