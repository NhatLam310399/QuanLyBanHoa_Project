using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanHoa.Models;
namespace QuanLyBanHoa.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        DataConnectDataContext data= new DataConnectDataContext();
        
        public ActionResult DangNhap()
        {

            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var tenDN= collection["TaiKhoan"];
            var mkDN= collection["MatKhau"];
            if(String.IsNullOrEmpty(tenDN))
            {
                ViewData["Loi1"]="Tên đăng nhập không được trống!";

            }
            else if (String.IsNullOrEmpty(mkDN))
            {
                ViewData["Loi2"] = "Mật khẩu không được bỏ trống";
            }
            else
            {
                KhachHang kh = data.KhachHangs.SingleOrDefault(n=>n.TaiKhoan  == tenDN && n.MatKhau == mkDN);
                if(kh != null)
                {
                    Session["TaiKhoan"]=kh;
                    return RedirectToAction("TrangChu", "TrangChu");
                }
                else
                {
                    ViewBag.ThongBao=" Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();

        }
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(FormCollection collection, KhachHang kh)
        {
            var hoten = collection["Tenkh"];
            var tenDN = collection["Tk"];
            var mkDN = collection["Mk"];
            var diachi = collection["Dchi"];
            var email = collection["mail"];
            var dt = collection["Dt"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Nsinh"]);
            if (hoten.Length < 0)
                ViewData["Loi1"] = "Họ tên không được để trống";
            else if (String.IsNullOrEmpty(tenDN))
                ViewData["Loi2"] = "Phải nhập tên đăng nhập";
            else if (tenDN.Length < 8)
                ViewData["Loi2.1"] = "Tên đăng nhập phải nhiều hơn 8 ký tự";
            else if (String.IsNullOrEmpty(mkDN))
                ViewData["Loi3"] = "Phải nhập mật khẩu";
            else if (mkDN.Length < 6 || mkDN.Length > 15)
                ViewData["Loi3.1"] = "Mật khẩu phải từ 6 - 15 ký tự";
            else if (String.IsNullOrEmpty(email))
                ViewData["Loi5"] = "Email không được bỏ trống";
            else if (!email.Contains("@") || !email.Contains(".com"))
                ViewData["Loi5.1"] = "Email phải đúng định dạng";
            else if (String.IsNullOrEmpty(dt))
                ViewData["Loi6"] = "Số điện thoại không được bỏ trống";
            else if (dt.Length < 10 || dt.Length > 10)
                ViewData["Loi6.2"] = "Số điện thoại gồm 10 chữ số.";
            else if (String.IsNullOrEmpty(diachi))
                ViewData["Loi7"] = "Địa chỉ không được bỏ trống";
            else if (ngaysinh.Length < 0)
                ViewData["Loi8"] = "Ngày sinh không được bỏ trống";
            else
            {
                kh.TenKH = hoten;
                kh.TaiKhoan = tenDN;
                kh.MatKhau = mkDN;
                kh.DiaChi = diachi;
                kh.Email = email;
                kh.DienThoai = dt;
                kh.NgaySinh = Convert.ToDateTime(ngaysinh.ToString());
                data.KhachHangs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
            return this.DangKy();

        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("TrangChu", "TrangChu");
        }
    }
}
