package com.example.datn_sd_78.service;

import com.example.datn_sd_78.entity.GioHangChiTiet;
import com.example.datn_sd_78.entity.SanPham;
import com.example.datn_sd_78.entity.SanPhamChiTiet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class GioHangService {
    @Autowired
    SanPhamService sanPhamService;

    List<GioHangChiTiet> items = new ArrayList<>();

    // Trả về danh sách các mặt hàng trong giỏ hàng
    public List<GioHangChiTiet> getItems() {
        return items;
    }

    // Thêm sản phẩm vào giỏ hàng
    public void add(int id) {
        // Tìm sản phẩm trong giỏ hàng
        GioHangChiTiet gioHangChiTiet = items
                .stream()
                .filter(gh -> gh.getChiTietSanPham().getSanPham().getId() == id)
                .findFirst()
                .orElse(null);

        // Nếu sản phẩm đã có trong giỏ, tăng số lượng
        if (gioHangChiTiet != null) {
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + 1);
            return;
        }

        // Lấy sản phẩm từ dịch vụ
        SanPham sanPham = sanPhamService.findById(id);

        if (sanPham != null) {
            // Nếu bạn chưa có `SanPhamChiTiet` trong giỏ, bạn có thể tạo mới đối tượng
            // hoặc giả lập `SanPhamChiTiet` từ `SanPham`
            SanPhamChiTiet sanPhamChiTiet = new SanPhamChiTiet();
            sanPhamChiTiet.setSanPham(sanPham);

            // Thêm sản phẩm vào giỏ hàng với số lượng 1
            items.add(new GioHangChiTiet(null, null, sanPhamChiTiet, 1));
        }
    }

    public void xoa(int id) {
        // Lọc và giữ lại các sản phẩm không trùng với id sản phẩm cần xóa
        items = items.stream()
                .filter(gh -> gh.getChiTietSanPham().getSanPham().getId() != id)
                .collect(Collectors.toList());
    }


    public int getTongSoLuong() {
        int tongSoLuong = 0;
        for (GioHangChiTiet gioHangChiTiet : items) {
            tongSoLuong += gioHangChiTiet.getSoLuong();
        }
        return tongSoLuong;
    }

    public int getTongGiaTri() {
        BigDecimal tongGiaTri = BigDecimal.ZERO; // Sử dụng BigDecimal để tránh mất mát độ chính xác
        for (GioHangChiTiet gioHangChiTiet : items) {
            // Lấy chi tiết sản phẩm từ giỏ hàng
            SanPhamChiTiet sanPhamChiTiet = gioHangChiTiet.getChiTietSanPham(); // Giả sử bạn có phương thức này
            // Lấy giá bán từ sản phẩm
            BigDecimal giaBan = sanPhamChiTiet.getSanPham().getGiaBan();
            // Cộng dồn giá trị
            tongGiaTri = tongGiaTri.add(giaBan.multiply(BigDecimal.valueOf(gioHangChiTiet.getSoLuong())));
        }
        return tongGiaTri.intValue(); // Chuyển đổi về kiểu int nếu cần
    }

    public void update(int id, Integer soLuong) {
        GioHangChiTiet gioHangChiTiet = items
                .stream()
                .filter(gh -> gh.getChiTietSanPham().getSanPham().getId() == id)
                .findFirst()
                .orElse(null);

        // Nếu sản phẩm đã có trong giỏ, tăng số lượng
        if (gioHangChiTiet != null) {
            gioHangChiTiet.setSoLuong(soLuong);
            return;
        }
    }
}


