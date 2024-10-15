package com.example.datn_sd_78.controller;

import org.springframework.web.multipart.MultipartFile;
import com.example.datn_sd_78.entity.*;
import com.example.datn_sd_78.repository.*;
import com.example.datn_sd_78.service.GioHangService;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.UnitValue;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class SanPhamController {

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @GetMapping("/menu")
    public String showProductManagement() {
        return "menu";
    }

    @GetMapping("/product")
    public String getSanPham(Model model) {
        List<SanPham> sanPhams = sanPhamRepository.findAll();
        System.out.println("Số lượng sản phẩm: " + sanPhams.size());
        model.addAttribute("sanphams", sanPhams);
        return "trangChu";
    }


    @GetMapping("/detail/{id}")
    public String xemSanPham(@PathVariable int id, Model model) {
        Optional<SanPham> sanPhamOptional = sanPhamRepository.findById(id);
        if (sanPhamOptional.isPresent()) {
            model.addAttribute("product", sanPhamOptional.get());
        } else {
            return "redirect:/";
        }
        return "detail_user";
    }

    @GetMapping("/giohang")
    public String showGioHang(Model model) {
        // Lấy danh sách sản phẩm trong giỏ hàng từ service
        List<GioHangChiTiet> gioHangItems = gioHangService.getItems();
        int tongGiaTri = gioHangService.getTongGiaTri();

        // Thêm danh sách vào model để JSP có thể truy cập
        model.addAttribute("giohang", gioHangItems);
        model.addAttribute("tongGiaTri", tongGiaTri);

        return "giohang";
    }


    @GetMapping("/add-gio-hang/{id}")
    public String addGioHang(@PathVariable int id) {
        gioHangService.add(id);
        return "redirect:/giohang";
    }

    @RequestMapping("/delete/{id}")
    public String xoaGioHang(@PathVariable int id) {
        gioHangService.xoa(id);
        if (gioHangService.getTongSoLuong() == 0) {
            return "redirect:/product"; // Chuyển hướng về trang sản phẩm nếu giỏ hàng rỗng
        }
        return "redirect:/giohang"; // Ngược lại, quay lại trang giỏ hàng
    }

    @PostMapping("/update/{id}")
    public String updateGioHang(@PathVariable int id, @RequestParam("soLuong") Integer soLuong) {
        System.out.println("ID sản phẩm: " + id + ", Số lượng: " + soLuong);
        gioHangService.update(id, soLuong);
        return "redirect:/giohang";
    }

    @GetMapping("/index")
    private String show(Model model) {
        List<SanPham> sp = sanPhamRepository.findAll();
        model.addAttribute("dataSp", sp);
        return "hello";
    }


    @GetMapping("/spct")
    private String show1(Model model) {
        List<SanPhamChiTiet> spct = chiTietSanPhamRepository.findAll();
        model.addAttribute("dataSpct", spct);
        return "SanPhamChiTiet";
    }

    @GetMapping("/search")
    public String searchProducts(@RequestParam("query") String query, Model model) {
        List<SanPham> sanPhams = sanPhamRepository.findByTenContaining(query.toLowerCase());
        model.addAttribute("dataSp", sanPhams);
        return "hello";
    }

    @GetMapping("/sanphamDetail")
    public String getSanPhamDetail(@RequestParam("id") Integer id, Model model) {
        SanPhamChiTiet spct = chiTietSanPhamRepository.findById(id).orElse(null);
        if (spct != null) {
            model.addAttribute("selectedProduct", spct);
        }

        List<SanPhamChiTiet> dataSpct = chiTietSanPhamRepository.findAll();
        model.addAttribute("dataSpct", dataSpct);

        return "SanPhamChiTiet";
    }

    @GetMapping("/exportPDF")
    public void exportPDF(HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=products.pdf");

        PdfWriter writer = new PdfWriter(response.getOutputStream());
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);

        PdfFont font = PdfFontFactory.createFont(StandardFonts.HELVETICA);
        document.setFont(font);

        List<SanPhamChiTiet> chiTietSanPhams = chiTietSanPhamRepository.findAll();

        Table table = new Table(7);
        table.setWidth(UnitValue.createPercentValue(100));

        table.addHeaderCell(new Cell().add(new Paragraph("Mã sản phẩm")).setFontSize(10)); // Thay đổi kích thước nếu cần
        table.addHeaderCell(new Cell().add(new Paragraph("Tên sản phẩm")).setFontSize(10));
        table.addHeaderCell(new Cell().add(new Paragraph("Số lượng")).setFontSize(10));
        table.addHeaderCell(new Cell().add(new Paragraph("Thương hiệu")).setFontSize(10));
        table.addHeaderCell(new Cell().add(new Paragraph("Màu sắc")).setFontSize(10));
        table.addHeaderCell(new Cell().add(new Paragraph("Kích thước")).setFontSize(10));
        table.addHeaderCell(new Cell().add(new Paragraph("Trạng thái")).setFontSize(10));

        for (SanPhamChiTiet spct : chiTietSanPhams) {
            table.addCell(spct.getSanPham().getMa());
            table.addCell(spct.getSanPham().getTen());
            table.addCell(String.valueOf(spct.getSanPham().getSoLuong()));
            table.addCell(spct.getSanPham().getThuongHieu());
            table.addCell(spct.getMauSac().getTen());
            table.addCell(spct.getSize().getTen());
            table.addCell(spct.getSanPham().getTrangThai() == 1 ? "Còn hàng" : "Hết hàng");
        }

        document.add(new Paragraph("Danh Sách Sản Phẩm").setFontSize(18));
        document.add(table);

        document.close();
    }

    @Autowired
    private ChatLieuRepository chatLieuRepository;

    @Autowired
    private DanhMucRepository danhMucRepository;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    private SizeRepository sizeRepository;

    @Autowired
    private KieuDangRepository kieuDangRepository;

    @GetMapping("/addSp")
    public String showAddSanPhamForm(Model model) {
        // Lấy danh sách danh mục, chất liệu, màu sắc, size và kiểu dáng từ database
        List<DanhMuc> danhMucs = danhMucRepository.findAll();
        List<ChatLieu> chatLieus = chatLieuRepository.findAll();
        List<MauSac> mauSacs = mauSacRepository.findAll();
        List<Size> sizes = sizeRepository.findAll();
        List<KieuDang> kieuDangs = kieuDangRepository.findAll();

        // Thêm danh sách vào model để hiển thị trong view
        model.addAttribute("danhMucs", danhMucs);
        model.addAttribute("chatLieus", chatLieus);
        model.addAttribute("mauSacs", mauSacs);
        model.addAttribute("sizes", sizes);
        model.addAttribute("kieuDangs", kieuDangs);

        return "addSanPham"; // Trả về trang thêm sản phẩm
    }

    // Xử lý thêm sản phẩm
    @PostMapping("/addProduct")
    public String addProduct(@RequestParam("ma") String ma,
                             @RequestParam("ten") String ten,
                             @RequestParam("soLuong") int soLuong,
                             @RequestParam("danhMuc") Integer danhMucId,
                             @RequestParam("thuongHieu") String thuongHieu,
                             @RequestParam("chatLieu") Integer chatLieuId,
                             @RequestParam("mauSac") Integer mauSacId,
                             @RequestParam("size") Integer sizeId,
                             @RequestParam("kieuDang") Integer kieuDangId,
                             @RequestParam("qrcode") String qrcode,
                             @RequestParam("image") MultipartFile image) { // Thêm tham số image vào đây
        // Tạo đối tượng sản phẩm mới
        SanPham sanPham = new SanPham();
        sanPham.setMa(ma);
        sanPham.setTen(ten);
        sanPham.setSoLuong(soLuong);
        sanPham.setThuongHieu(thuongHieu);
        sanPham.setQrcode(qrcode);

        if (!image.isEmpty()) {
            try {
                // Tạo thư mục lưu trữ nếu chưa tồn tại
                File uploadDir = new File("path/to/upload/dir");
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Lưu hình ảnh
                String imagePath = uploadDir.getAbsolutePath() + "/" + image.getOriginalFilename();
                image.transferTo(new File(imagePath));
                sanPham.setAnh(imagePath); // Lưu đường dẫn hình ảnh vào đối tượng sản phẩm
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        DanhMuc danhMuc = danhMucRepository.findById(danhMucId).orElse(null);
        ChatLieu chatLieu = chatLieuRepository.findById(chatLieuId).orElse(null);
        MauSac mauSac = mauSacRepository.findById(mauSacId).orElse(null);
        Size size = sizeRepository.findById(sizeId).orElse(null);
        KieuDang kieuDang = kieuDangRepository.findById(kieuDangId).orElse(null);

        sanPham.setDanhMuc(danhMuc);
        sanPham.setChatLieu(chatLieu);
        sanPham.setMauSac(mauSac);
        sanPham.setSize(size);
        sanPham.setKieuDang(kieuDang);

        // Lưu sản phẩm vào cơ sở dữ liệu
        sanPhamRepository.save(sanPham);

        return "redirect:/product"; // Chuyển hướng về trang danh sách sản phẩm
    }



}
