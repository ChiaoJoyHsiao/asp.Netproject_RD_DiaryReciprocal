using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class joinaccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        GridView1.DataBind();


        if (TextBox2.Text == TextBox3.Text)
        {

            if (GridView1.Rows.Count == 0)
            {
                try
                {
                    SqlDataSource1.Insert();
                    Label1.Text = "註冊成功,請重新登入";
                    Label2.Text = "";

                }
                catch
                {
                    Label1.Text = "註冊失敗,請重試一遍";
                }

            }
            else
            {
                Label2.Text = "此帳號已被使用過";
                Label1.Text = "";


            }

        }
        else
        {
            Label2.Text = "密碼輸入不相同,請重新輸入密碼";
            Label1.Text = "";


        }



    }


  
}