using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

namespace AdSelection
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ASPxGridView1_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            if (e.NewValues["Description"].ToString() == "" || e.NewValues["Description"].ToString().Length > 60)
            {
                e.Errors.Add(((ASPxGridView)sender).Columns["Description"], "Incorrect value");
                ASPxTextBox txt = ((ASPxGridView)sender).FindEditFormTemplateControl("ASPxTextBox1") as ASPxTextBox;
                txt.IsValid = false;

            }



        }
        protected void ASPxGridView1_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.EditForm)
            {
                ASPxTextBox txt = ((ASPxGridView)sender).FindEditFormTemplateControl("ASPxTextBox1") as ASPxTextBox;
                ASPxLabel errLab = ((ASPxGridView)sender).FindEditFormTemplateControl("errLab") as ASPxLabel;
                if (!txt.IsValid)
                {
                    errLab.Text = "Please correct this value";
                }

            }
        }
    }
}
