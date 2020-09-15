using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLyBanHoa.Models;
namespace QuanLyBanHoa.Models
{
    public class GioHang
    {
        DataConnectDataContext data = new DataConnectDataContext();
        public string sMahoa { set; get; }
        public string sTenhoa { set; get; }
        public string sHinhAnh { set; get; }
        public float iDonGia { set; get; }
        public int iSoluong { set; get; }
        public float ithanhTien
        {
            
            get {
                if (iSoluong > 10)
                {
                    return iSoluong * (iDonGia - (iDonGia * 01));
                }
                return iSoluong * iDonGia;
            }
        }
        public GioHang(string MaH)
        {
            sMahoa = MaH;
            Hoa h = data.Hoas.Single(n => n.MaHoa == sMahoa);
            sTenhoa = h.TenHoa;
            sHinhAnh = h.HinhAnh;
            iDonGia = float.Parse(h.Giaban.ToString());
            iSoluong = 1;
        }
    }
}