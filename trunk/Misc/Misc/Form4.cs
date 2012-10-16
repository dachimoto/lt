using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Misc
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                mypartner.SforceService binding = new mypartner.SforceService();
                mypartner.LoginResult lr = binding.login("dachimoto@hotmail.com", "+v+h@0+v6854XhuVzAcbHWENCYLHNQX41z943");
                if (!lr.passwordExpired)
                {
                    binding.Url = lr.serverUrl;
                    binding.SessionHeaderValue = new mypartner.SessionHeader();
                    binding.SessionHeaderValue.sessionId = lr.sessionId;

                    mypartner.sObject[] accs = new mypartner.sObject[1];

                    mypartner.sObject sObj = new mypartner.sObject();
                    System.Xml.XmlElement[] acct = new System.Xml.XmlElement[12];
                    System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                    acct[0] = doc.CreateElement("Name");
                    acct[0].InnerText = txtName.Text.Trim();
                    acct[1] = doc.CreateElement("Author__c");
                    acct[1].InnerText = txtAuthor.Text;
                    acct[2] = doc.CreateElement("MoveList__c");
                    acct[2].InnerText = txtMoveList.Text;
                    acct[3] = doc.CreateElement("Description__c");
                    acct[3].InnerText = txtDescription.Text;                    
                    acct[4] = doc.CreateElement("RedFirst__c");
                    acct[4].InnerText = txtRed.Text;
                    acct[5] = doc.CreateElement("Result__c");
                    acct[5].InnerText = txtResult.Text;
                    acct[6] = doc.CreateElement("SharedBy__c");
                    acct[6].InnerText = txtSharedBy.Text;
                    acct[7] = doc.CreateElement("SharedToken__c");
                    acct[7].InnerText = txtSharedToken.Text;
                    acct[8] = doc.CreateElement("Source__c");
                    acct[8].InnerText = txtSource.Text;
                    acct[9] = doc.CreateElement("Comments__c");
                    acct[9].InnerText = txtComments.Text;
                    acct[10] = doc.CreateElement("Variations__c");
                    acct[10].InnerText = txtVariations.Text;
                    acct[11] = doc.CreateElement("Fen__c");
                    acct[11].InnerText = txtFen.Text;
                    sObj.type = "XiangqiQuiz__c";
                    sObj.Any = acct;
                    accs[0] = sObj;

                    mypartner.SaveResult[] sr = binding.create(accs);

                    for (int k = 0; k < sr.Length; k++)
                    {
                        if (sr[k].success)
                        {
                            MessageBox.Show(sr[k].id.ToString());
                        }
                        else
                        {
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}