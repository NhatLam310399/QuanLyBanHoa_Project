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
                ViewData["Loi1"]="Phải nhập tên đăng nhập";

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
            var hoten= collection["Tenkh"];
            var tenDN= collection["Tk"];
            var mkDN=collection["Mk"];
            var diachi= collection["Dchi"];
            var email= collection["mail"];
            var dt= collection["Dt"];
            var ngaysinh=String.Format("{0:MM/dd/yyyy}",collection["Nsinh"]);
            if(String.IsNullOrEmpty(hoten))
                ViewData["Loi1"]= "Họ tên không được để trống";
            else if(String.IsNullOrEmpty(tenDN))
                ViewData["Loi2"]="Phải nhập tên đăng nhập";
            else if(String.IsNullOrEmpty(mkDN))
                ViewData["Loi3"]="Phải nhập mật khẩu";
            else if(String.IsNullOrEmpty(email))
                ViewData["Loi5"]="Email không được bỏ trống";
            else if(String.IsNullOrEmpty(dt))
                ViewData["Loi6"]="Số điện thoại không được bỏ trống";
            else if (String.IsNullOrEmpty(diachi))
                ViewData["Loi7"] = "Địa chỉ không được bỏ trống";
            else
            {
                kh.TenKH=hoten;
                kh.TaiKhoan=tenDN;
                kh.MatKhau=mkDN;
                kh.DiaChi=diachi;
                kh.Email=email;
                kh.DienThoai=dt;
                kh.NgaySinh=DateTime.Parse(ngaysinh);
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
