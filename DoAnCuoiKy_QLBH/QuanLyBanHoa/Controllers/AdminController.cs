using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanHoa.Models;
using PagedList.Mvc;
using PagedList;
namespace QuanLyBanHoa.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        DataConnectDataContext data = new DataConnectDataContext();
        public ActionResult Admin()
        {
            return View();
        }
        public ActionResult Edit()
        {
            return View();
        }

        public ActionResult LoginAD()
        {
            return View() ;
        }
        [HttpPost]
        public ActionResult LoginAD(FormCollection col)
        {
            var tenDN = col["TkAD"];
            var mkDN = col["MkAD"];
            if (String.IsNullOrEmpty(tenDN) || String.IsNullOrEmpty(mkDN))
            {
                ViewData["Loi1"] = "Không được bỏ trống !";

            }
            else
            {
                Admin ad = data.Admins.SingleOrDefault(n => n.TaikhoanAD == tenDN && n.MatKhauAD == mkDN);
                if (ad != null)
                {
                    Session["TaikhoanAD"] = ad;
                    return RedirectToAction("QLH", "Admin");
                }
                else
                {
                    ViewBag.ThongBao = " Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();

        }
        private List<Hoa> layhoa()
        {
            return data.Hoas.ToList();
        }
         public ActionResult QLH(int? page)
        {
             int pageN= (page ?? 1);
             int pageS= 5;
             if (Session["TaikhoanAD"] == null)
                 return RedirectToAction("LoginAD", "Admin");
             else
             {
                 pageN = (page ?? 1);
                 pageS = 5;
             }
             var showAll = data.Hoas.OrderBy(n => n.MaHoa).ToList();
            return View(showAll.ToPagedList(pageN, pageS));
        }
         public ActionResult DangXuat()
         {
                 Session["TaikhoanAD"] = null;
                 return RedirectToAction("TrangChu", "TrangChu");
         }
        [HttpGet]
         public ActionResult XoaHoa(string idhoa)
         {
             Hoa h = data.Hoas.SingleOrDefault(n => n.MaHoa == idhoa);
             ViewBag.idhoa = h.MaHoa;
             if (h == null)
             {
                 Response.StatusCode = 404;
                 return null;
             }
             return View(h);
         }
        [HttpPost, ActionName("XoaHoa")]
        public ActionResult XacNhanXoa(string idh)
        {
            Hoa h = data.Hoas.SingleOrDefault(n => n.MaHoa == idh);
            ViewBag.idh = h.MaHoa;
            if (h == null)
            {
                Response.SubStatusCode = 404;
                return null;
            }
            data.Hoas.DeleteOnSubmit(h);
            data.SubmitChanges();
            return RedirectToAction("QLH");
        }
        public ActionResult SuaHoa(string mah)
        {
            return View();
        }
    }
}
