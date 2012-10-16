using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Misc
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }

        private static DataTable GetSforceData()
        {
            DataTable dt = null;
            mypartner.SforceService binding = new mypartner.SforceService();
            mypartner.LoginResult lr = binding.login("abc@def.com", "xyz6854XhuVzAcbHWENCYLHNQX41z943");
            string strSQL ="", strColumnNames = "";
            if (!lr.passwordExpired)
            {
                binding.Url = lr.serverUrl;
                binding.SessionHeaderValue = new mypartner.SessionHeader();
                binding.SessionHeaderValue.sessionId = lr.sessionId;

                mypartner.QueryResult qr = null;
                binding.QueryOptionsValue = new mypartner.QueryOptions();
                binding.QueryOptionsValue.batchSize = 25;
                binding.QueryOptionsValue.batchSizeSpecified = true;                
                qr = binding.query(strSQL);
                bool done = false;

                if (qr.size > 0)
                {
                    dt = new DataTable();
                    mypartner.sObject sOtmp = (mypartner.sObject)qr.records[0];
                    int iColumnCount = 0;
                    if (strColumnNames.Length > 0)
                    {
                        string[] arrColumnNames = strColumnNames.Split(',');
                        iColumnCount = arrColumnNames.Length;
                        for (int i = 0; i < iColumnCount; i++)
                        {
                            dt.Columns.Add(arrColumnNames.GetValue(i).ToString());
                        }
                    }
                    else
                    {
                        iColumnCount = sOtmp.Any.Length;
                        for (int i = 0; i < sOtmp.Any.Length; i++)
                        {
                            dt.Columns.Add(sOtmp.Any[i].LocalName);
                        }
                    }
                    string[] prValues = new string[iColumnCount];
                    while (!done)
                    {
                        for (int i = 0; i < qr.records.Length; i++)
                        {
                            sOtmp = (mypartner.sObject)qr.records[i];

                            int j = 0, iColIndex = 0;
                            while (j < sOtmp.Any.Length)
                            {
                                prValues.SetValue(sOtmp.Any[j].InnerText, iColIndex);
                                iColIndex++;
                                j++;
                            }
                            dt.Rows.Add(prValues);
                        }

                        if (qr.done)
                        {
                            done = true;
                        }
                        else
                        {
                            qr = binding.queryMore(qr.queryLocator);
                        }
                    }
                }
            }

            return dt;
        }
    }
}