using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Misc
{
    public partial class Form7 : Form
    {
        public Form7()
        {
            InitializeComponent();
        }
        
        string getPageSource(string URL){
            System.Net.WebClient webClient = new System.Net.WebClient();
            string strSource = webClient.DownloadString(URL);
            webClient.Dispose();
            return strSource;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string sSource = getPageSource(txtURL.Text);
            //http://01xq.com/e_game_view.asp?id=055009C493B2D0
            string sMoves = "";
            int iPos1 = 0, iPos2 = 0;
            iPos1 = sSource.IndexOf("[DHJHtmlXQ_34]");
            iPos2 = sSource.IndexOf("[/DHJHtmlXQ_34]",iPos1 +1);
            sMoves = sSource.Substring(iPos1 + 14, iPos2 - iPos1 - 14);
            txtSource.Text = sMoves;
            string sFen = "rheakaehr0000000000c00000c0p0p0p0p0p000000000000000000P0P0P0P0P0C00000C0000000000RHEAKAEHR";
            string sNextFen = "rheakaehr0000000000c00000c0p0p0p0p0p000000000000000000P0P0P0P0P0C00000C0000000000RHEAKAEHR";
            int i = 0;
            string sMoves2 = "";
            while (i < sMoves.Length)
            {
                sFen = sNextFen;
                sMoves2 += GetMove(sMoves.Substring(i, 4), sFen, ref sNextFen) + " ";
                i = i + 4;
            }
            txtMoves.Text = sMoves2;
            //MessageBox.Show(sNextFen);
        }

        private string GetMove(string sCooridate, string sCurFen, ref string sNextFen)
        {
            string sMove = "", sPiece = "";
            int x1 = int.Parse(sCooridate.Substring(0, 1));
            int y1 = int.Parse(sCooridate.Substring(1, 1));
            int x2 = int.Parse(sCooridate.Substring(2, 1));
            int y2 = int.Parse(sCooridate.Substring(3, 1));
            int iPos1 = x1 + (9 - y1) * 9;
            int iPos2 = x2 + (9 - y2) * 9;
            sPiece = sCurFen.Substring(iPos1, 1);
            sMove = sPiece;
            if (sPiece == sPiece.ToUpper())
            {
                sMove += (9 - x1).ToString();
            }
            else
            {
                sMove += (x1+1).ToString();
            }
            if (x1 == x2)
            {
                if (sPiece == sPiece.ToUpper())
                {
                    sMove += ((y1<y2)?"+":"-") + Math.Abs(y2 - y1).ToString();
                }
                else
                {
                    sMove += ((y1<y2)?"-":"+") + Math.Abs(y2 - y1).ToString();
                }
            }
            else if (y1 == y2)
            {
                if (sPiece == sPiece.ToUpper())
                {
                    sMove += "." + (9 - x2).ToString();
                }
                else
                {
                    sMove += "." + (x2 + 1).ToString();
                }
            }
            else
            {
                if (sPiece == sPiece.ToUpper())
                {
                    sMove += "+" + (9 - x2).ToString();
                }
                else
                {
                    sMove += "+" + (x2 + 1).ToString();
                }
            }
            sNextFen = sCurFen.Substring(0, iPos1) + "0" + sCurFen.Substring(iPos1 + 1);
            sNextFen = sNextFen.Substring(0, iPos2) + sPiece + sNextFen.Substring(iPos2 + 1);
            return sMove.ToUpper();
        }
    }
}