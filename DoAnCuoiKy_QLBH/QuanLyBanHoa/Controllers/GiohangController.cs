using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanHoa.Models;
namespace QuanLyBanHoa.Controllers
{
    public class GiohangController : Controller
    {
        //
        // GET: /Giohang/
        DataConnectDataContext data = new DataConnectDataContext();
        public List<GioHang> Laygiohang()
        {
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang == null)
            {
                lstGiohang = new List<GioHang>();
                Session["Giohang"] = lstGiohang;
            }
            return lstGiohang;
        }
        public ActionResult Themgiohang(string sMahoa, string strUrl)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sanpham = lstGiohang.Find(n => n.sMahoa == sMahoa);
            if (sanpham == null)
            {
                sanpham = new GioHang(sMahoa);
                lstGiohang.Add(sanpham);
                return Redirect(strUrl);
            }
            else
            {
                sanpham.iSoluong++;
                return Redirect(strUrl);
            }

        }
        private int TongSL()
        {
            int iTongSL = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongSL = lstGiohang.Sum(n => n.iSoluong);
            }
            return iTongSL;
        }


        private float tongTien()
        {
            float iTongTien = 0;
            List<GioHang> lstGiohang = Session["Giohang"] as List<GioHang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.ithanhTien);
            }
            return iTongTien;
        }


        public ActionResult Giohang()
        {
            List<GioHang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("TrangChu", "TrangChu");
            }
            ViewBag.Tongsoluong = TongSL();
            ViewBag.Tongtien = tongTien();
            return View(lstGiohang);
        }
        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSL();
            ViewBag.Tongtien = tongTien();
            return PartialView();
        }
        public ActionResult ChiTietGH(string id)
        {

            var ct = data.Hoas.Where(m => m.MaHoa == id).FirstOrDefault();
            return View(ct);
        }
        public ActionResult XoaGiohang()
        {
            List<GioHang> lstGiohang = Laygiohang();
           
            return RedirectToAction("TrangChu", "TrangChu");
        }

        public ActionResult XoaMotSP(string masp)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sp = lstGiohang.SingleOrDefault(n => n.sMahoa == masp);
            if (sp != null)
            {
                lstGiohang.RemoveAll(n => n.sMahoa == masp);
                return RedirectToAction("Giohang");
            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("TrangChu", "TrangChu");
            }
            return RedirectToAction("Giohang");
        }
        public ActionResult Capnhatgiohang(string masp, FormCollection f)
        {
            List<GioHang> lstGiohang = Laygiohang();
            GioHang sp = lstGiohang.SingleOrDefault(n => n.sMahoa == masp);
            if (sp != null)
            {
                sp.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("Giohang");
        }
        [HttpGet]
        public ActionResult Dathang()
        {
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                return RedirectToAction("Dangnhap", "KhachHang");
            }
            if (Session["Giohang"] == null)
            {

                return RedirectToAction("TrangChu", "TrangChu");

            }

            List<GioHang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSL();
            ViewBag.Tongtien = tongTien();

            return View(lstGiohang);
        }
        [HttpPost]
        public ActionResult Dathang(FormCollection collection)
        {
            List<GioHang> lstGiohang = Laygiohang();
            HDBan hd = new HDBan();
            KhachHang kh = (KhachHang)Session["Taikhoan"];
            
            hd.MaKH = kh.MaKH;
            hd.NgayBan = DateTime.Now;

            data.HDBans.InsertOnSubmit(hd);
            data.SubmitChanges();
            foreach (var item in lstGiohang)
            {
                ChitietHDBan cthd = new ChitietHDBan();
                cthd.MaHD = hd.MaHD;
                cthd.MaHoa = item.sMahoa;
                cthd.SoLuong = item.iSoluong;
                cthd.DonGia = (double)item.iDonGia;
                hd.TongTien = (int)item.ithanhTien;
                data.ChitietHDBans.InsertOnSubmit(cthd);
            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("XacNhan", "Giohang");
        }
        public ActionResult XacNhan()
        {
            return View();
        }


    }

}
