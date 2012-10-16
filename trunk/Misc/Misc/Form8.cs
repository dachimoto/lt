using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.OleDb;

namespace Misc
{
    public partial class Form8 : Form
    {
        private string sCnnString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\\My Documents\\Database1.accdb;Jet OLEDB:Database Password=1234567890;";
        public Form8()
        {
            InitializeComponent();
        }

        private void LoadDataToGrid()
        {
            try
            {
                string sSQL = "SELECT * FROM tblTest";
                OleDbConnection cn = new OleDbConnection(sCnnString);
                cn.Open();
                OleDbCommand cmd = new OleDbCommand(sSQL, cn);
                OleDbDataAdapter ad = new OleDbDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    dtgrd.DataSource = ds.Tables[0];
                }
                cn.Close();
                ds = null;
                cmd = null;
                cn = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Form8_Load(object sender, EventArgs e)
        {
            LoadDataToGrid();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string sSQL = "INSERT INTO tblTest(Col1,Col2) VALUES(@Col1,@Col2)";
                OleDbConnection cn = new OleDbConnection(sCnnString);
                cn.Open();
                OleDbCommand cmd = new OleDbCommand(sSQL, cn);
                OleDbParameter pr = null;
                pr = new OleDbParameter("@Col1", OleDbType.VarWChar, 255);
                pr.Value = txtCol1.Text;
                cmd.Parameters.Add(pr);                 
                pr = new OleDbParameter("@Col2",OleDbType.LongVarWChar);
                pr.Value = txtCol2.Text;
                cmd.Parameters.Add(pr);

                cmd.ExecuteNonQuery();
                LoadDataToGrid();
                cn.Close();
                cmd = null;
                cn = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}