using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mypage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;


    
        if (Session["Login"] != null)
        {
            Label1.Text= (String)Session["user"];
            Label2.Text = (String)Session["user"];
            Label2.Text += "  已登入成功,可瀏覽網頁!";

            
        }

        else
            Label2.Text = "尚未登入,請先登入";






       for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label label= new Label();
            // 取的 GridView 第i行，第一列的值
            string strValue = GridView1.Rows[i].Cells[0].Text.ToString().Trim();
            // 抓取 GridView 內元件的值
            string strDate  = GridView1.Rows[i].Cells[1].Text.ToString().Trim();

            


            DateTime datetime = DateTime.Parse(strDate);
            DateTime now = DateTime.Now;
            TimeSpan line = datetime.Subtract(now);

            datename.Text = strValue.ToString();
           

            dateline.Text =line.Days.ToString()+"天";

            SqlDataSource2.Update();

            GridView1.DataBind();





        }

    }
}