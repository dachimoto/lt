using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Drawing.Imaging;

namespace Misc{
    public partial class Form2 : Form
    {
        [System.Runtime.InteropServices.DllImport("gdi32.dll")]
        public static extern long BitBlt(IntPtr hdcDest, int nXDest, int nYDest, int nWidth, int nHeight, IntPtr hdcSrc, int nXSrc, int nYSrc, int dwRop);
        private Bitmap memoryImage = null;

        private bool bIsDragging = false;
        private int iCurrentX, iCurrentY, iOldLeft, iOldTop;
        private const int xB = 1;
        private const int yB = 1;
        private const int iWidth = 40;
        PictureBox[] arr = new PictureBox[32];        

        public Form2()
        {
            InitializeComponent();
        }

        private void pictureBox2_MouseUp(object sender, MouseEventArgs e)
        {
            bIsDragging = false;
        }

        private void CaptureScreen()
        {
            Graphics mygraphics = this.CreateGraphics();
            Size s = pictureBox1.Size;
            memoryImage = new Bitmap(s.Width, s.Height, mygraphics);
            Graphics memoryGraphics = Graphics.FromImage(memoryImage);
            IntPtr dc1 = mygraphics.GetHdc();
            IntPtr dc2 = memoryGraphics.GetHdc();
            BitBlt(dc2, 0, 0, pictureBox1.ClientRectangle.Width, pictureBox1.ClientRectangle.Height, dc1, 0, 0, 13369376);
            mygraphics.ReleaseHdc(dc1);
            memoryGraphics.ReleaseHdc(dc2);

            memoryImage.Save("D:\\temp.jpg");
        }


        private void Form2_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 32; i++)
            {
                arr[i] = new PictureBox();

                if (i == 0)
                {
                    arr[i].Name = "bk";
                    arr[i].Image = imageList1.Images["bk"];
                }
                else if (i == 1 || i == 2)
                {
                    arr[i].Name = "ba" + i.ToString();
                    arr[i].Image = imageList1.Images["ba"];
                }
                else if (i == 3 || i == 4)
                {
                    arr[i].Name = "be" + i.ToString();
                    arr[i].Image = imageList1.Images["be"];
                }
                else if (i == 5 || i == 6)
                {
                    arr[i].Name = "br" + i.ToString();
                    arr[i].Image = imageList1.Images["br"];
                }
                else if (i == 7 || i == 8)
                {
                    arr[i].Name = "bc" + i.ToString();
                    arr[i].Image = imageList1.Images["bc"];
                }
                else if (i == 9 || i == 10)
                {
                    arr[i].Name = "bh" + i.ToString();
                    arr[i].Image = imageList1.Images["bh"];
                }
                else if (i < 16)
                {
                    arr[i].Name = "bp" + i.ToString();
                    arr[i].Image = imageList1.Images["bp"];
                }
                else if (i == 16)
                {
                    arr[i].Name = "rK";
                    arr[i].Image = imageList1.Images["rk"];
                }
                else if (i == 17 || i == 18)
                {
                    arr[i].Name = "rA" + i.ToString();
                    arr[i].Image = imageList1.Images["ra"];
                }
                else if (i == 19 || i == 20)
                {
                    arr[i].Name = "rE" + i.ToString();
                    arr[i].Image = imageList1.Images["re"];
                }
                else if (i == 21 || i == 22)
                {
                    arr[i].Name = "rR" + i.ToString();
                    arr[i].Image = imageList1.Images["rr"];
                }
                else if (i == 23 || i == 24)
                {
                    arr[i].Name = "rC" + i.ToString();
                    arr[i].Image = imageList1.Images["rc"];
                }
                else if (i == 25 || i == 26)
                {
                    arr[i].Name = "rH" + i.ToString();
                    arr[i].Image = imageList1.Images["rh"];
                }
                else if (i < 32)
                {
                    arr[i].Name = "rP" + i.ToString();
                    arr[i].Image = imageList1.Images["rp"];
                }
                arr[i].Location = new Point(i % 4 * iWidth + 370, 1 + i / 4 * iWidth);
                arr[i].Size = new System.Drawing.Size(40, 40);
                arr[i].SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
                arr[i].MouseMove += new System.Windows.Forms.MouseEventHandler(this.picChess_MouseMove);
                arr[i].MouseDown += new System.Windows.Forms.MouseEventHandler(this.picChess_MouseDown);
                arr[i].MouseUp += new System.Windows.Forms.MouseEventHandler(this.picChess_MouseUp);
                Controls.Add(arr[i]);
                arr[i].BringToFront();
            }
            string sFen = "rheakaehr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RHEAKAEHR";
            InitBoard(sFen);
        }

        private void picChess_MouseDown(object sender, MouseEventArgs e)
        {
            bIsDragging = true;
            iCurrentX = e.X;
            iCurrentY = e.Y;
            PictureBox pic = (PictureBox)sender;
            iOldLeft = pic.Left;
            iOldTop = pic.Top;
            pic.BringToFront();
        }

        private void picChess_MouseMove(object sender, MouseEventArgs e)
        {
            if (bIsDragging)
            {
                PictureBox pic = (PictureBox)sender;
                pic.Top = pic.Top + (e.Y - iCurrentY);
                pic.Left = pic.Left + (e.X - iCurrentX);
            }
        }

        private void picChess_MouseUp(object sender, MouseEventArgs e)
        {
            bIsDragging = false;
            PictureBox pic = (PictureBox)sender;
            int iLeft = pic.Left - 1;
            int iTop = pic.Top - 1;
            int x = 0, y = 0;
            if (iLeft < xB || iTop < yB || iLeft > 8 * iWidth + iWidth / 2 || iTop > 9 * iWidth + iWidth / 2)
            {
                pic.Location = new Point(iOldLeft, iOldTop);
            }
            else
            {
                x = Convert.ToInt32(Math.Round(iLeft / (iWidth * 1.00), 0));
                y = Convert.ToInt32(Math.Round(iTop / (iWidth * 1.00), 0));
                iLeft = x * iWidth + 1;
                iTop = y * iWidth + 1;
                for (int i = 0; i < 32; i++)
                {
                    if (arr[i].Left == iLeft && arr[i].Top == iTop)
                    {
                        if (arr[i].Name.Substring(0, 1) != pic.Name.Substring(0, 1))
                        {
                            string sLocation = arr[i].Tag.ToString();
                            int iL = int.Parse(sLocation.Split(',')[0]);
                            int iT = int.Parse(sLocation.Split(',')[1]);
                            arr[i].Tag = "";
                            arr[i].Location = new Point(iL, iT);//or invisible                                                    
                            break;
                        }
                        else
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                    }
                }

                switch (pic.Name.Substring(1, 1))
                {
                    case "k":
                        if (x < 3 || x > 5 || y < 0 || y > 2)
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                    case "a":
                        if (!(((x == 3 || x == 5) && (y == 0 || y == 2)) || (x == 4 && y == 1)))
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                    case "e":
                        if (!(((x == 2 || x == 6) && (y == 0 || y == 4)) || ((x == 0 || x == 4 || x == 8) && y == 2)))
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                    case "p":
                        if (y < 3 || (x % 2 == 1 && y < 5))
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                    case "K":
                        if (x < 3 || x > 5 || y > 9 || y < 7)
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                    case "A":
                        if (!(((x == 3 || x == 5) && (y == 7 || y == 9)) || (x == 4 && y == 8)))
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                    case "E":
                        if (!(((x == 2 || x == 6) && (y == 5 || y == 9)) || ((x == 0 || x == 4 || x == 8) && y == 7)))
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                    case "P":
                        if (y > 6 || (x % 2 == 1 && y > 4))
                        {
                            pic.Location = new Point(iOldLeft, iOldTop);
                            return;
                        }
                        break;
                }
                pic.Location = new Point(iLeft, iTop);
            }
        }

        private void InitBoard(string sFen)
        {            
            sFen = sFen.Replace("9", "000000000").Replace("8", "00000000").Replace("7", "0000000").Replace("6", "000000").Replace("5", "00000").Replace("4", "0000").Replace("3", "000").Replace("2", "00").Replace("1", "0");
            sFen = sFen.Replace("/", "");
            for (int i = 0; i < sFen.Length; i++)
            {
                string sP = sFen.Substring(i, 1);
                int x = i % 9;
                int y = i / 9;
                for (int j = 0; j < 32; j++)
                {
                    if (arr[j].Name.Substring(1, 1) == sP && (arr[j].Tag==null || arr[j].Tag.ToString().Length == 0))
                    {
                        arr[j].Tag = arr[j].Left.ToString() + "," + arr[j].Top.ToString();
                        arr[j].Location = new Point(1 + x * iWidth, 1 + y * iWidth);                        
                        break;
                    }
                }
            }
        }

        private string _Fen = "";
        public string Fen
        {
            get { return _Fen; }
            set { _Fen = value; }
        }

        private string _MoveList = "";
        public string MoveList
        {
            get { return _MoveList; }
            set { _MoveList = value; }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CaptureScreen();
        }
    }
}