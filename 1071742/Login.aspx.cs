using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {


        GridView1.DataBind();
        if (GridView1.Rows.Count == 1)
        {
            Label1.Text = "登入成功";
            Session["Login"] = "LoginOK";
            Session["user"] = TextBox1.Text;
            Response.Redirect("mypage.aspx");

        }


        else
        {
            Label1.Text = "登入失敗";

        }
    }
}
