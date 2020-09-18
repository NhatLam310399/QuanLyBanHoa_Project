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
    public class TrangChuController : Controller
    {
        //
        // GET: /TrangChu/
        DataConnectDataContext data = new DataConnectDataContext();
        private List<Hoa> layhoa()
        {
            return data.Hoas.ToList();
        }
        public ActionResult TrangChu(int ? page)
        {

            List<Hoa> h = new List<Hoa>();
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var show = data.Hoas.ToList();
            return View(show.ToPagedList(pageNum,pageSize));
        }
    
        public ActionResult SinhNhat(int ? page)
        {
            List<Hoa> laysn = new List<Hoa>();
            int pageS = 9;
            int pageN = (page ?? 1);
            var showSn = data.Hoas.Where(m => m.MaLoai == "HSN").ToList();

            return View(showSn.ToPagedList(pageN,pageS));
        }
        public ActionResult KhaiTruong(int ? page)
        {
            List<Hoa> layKT = new List<Hoa>();
            int pageS = 9;
            int pageN = (page ?? 1);
            var showKT = data.Hoas.Where(m => m.MaLoai == "HKT").ToList();
            return View(showKT.ToPagedList(pageN,pageS));
        }
        public ActionResult TinhYeu(int ? page)
        {
            List<Hoa> layTY = new List<Hoa>();
            int pageS = 9;
            int pageN = (page ?? 1);
            var showTY = data.Hoas.Where(m => m.MaLoai == "HTY").ToList();
            return View(showTY.ToPagedList(pageN,pageS));
        }
        public ActionResult DamCuoi(int ? page)
        {
            List<Hoa> layC = new List<Hoa>();
            int pageS = 9;
            int pageN = (page ?? 1);
            var showC = data.Hoas.Where(m => m.MaLoai == "HDC").ToList();
            return View(showC.ToPagedList(pageN,pageS));
        }
        public ActionResult TotNghiep(int ? page)
        {
            List<Hoa> layTN = new List<Hoa>();
            int pageS = 9;
            int pageN = (page ?? 1);
            var showTN = data.Hoas.Where(m => m.MaLoai == "HTN").ToList();
            return View(showTN.ToPagedList(pageN,pageS));
        }
        public ActionResult LoaiKhac(int ? page)
        {
            List<Hoa> layK = new List<Hoa>();
            int pageS = 9;
            int pageN = (page ?? 1);
            var showT = data.Hoas.Where(m => m.MaLoai == "HLK").ToList();
            return View(showT.ToPagedList(pageN,pageS));
        }
        public ActionResult Ynghia()
        {
            var yn = (from a in data.LoaiHoas select a).ToList();
            return View(yn);
        }
        public ActionResult Blogs()
        {
            return View();
        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult ChiTiet(string id)
        {

            var ct = data.Hoas.Where(m => m.MaHoa == id).FirstOrDefault();
            return View(ct);
        }

        public ActionResult Search(int? page, string searchFull)
        {
            int pageS = 9;
            int pageN = (page ?? 1);
            var hoa = from s in data.Hoas select s;
            if (!String.IsNullOrEmpty(searchFull))
            {
                ViewBag.Ten =searchFull;
                hoa = hoa.Where(t => t.TenHoa.Contains(searchFull));
                return View(hoa.ToPagedList(pageN, pageS));
            }
            else
            {
                ViewBag.Ten = "Sản phẩm chưa được bán!!";
                var hoahoa = layhoa();
                return View(hoahoa.ToPagedList(pageN, pageS));
            }
           
        }
    }
}
