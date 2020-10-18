using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class insertdate : System.Web.UI.Page
{

    
    protected void Page_Load(object sender, EventArgs e)
    {

        
        
       

        if (Session["Login"] != null)
        {
            Label1.Text = (String)Session["user"];

        }

        else
            Label2.Text = "尚未登入,請先登入";

        transDate();


    }


    private void transDate()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            
            // 取的 GridView 第i行，第一列的值
            string strValue = GridView1.Rows[i].Cells[0].Text.ToString().Trim();
            // 抓取 GridView 內元件的值
            string strDate = GridView1.Rows[i].Cells[1].Text.ToString().Trim();

            DateTime datetime = DateTime.Parse(strDate);
            DateTime now = DateTime.Now;
            TimeSpan line = datetime.Subtract(now);

            datename.Text = strValue.ToString();


            dateline.Text = line.Days.ToString() + "天";

            SqlDataSource2.Update();

            GridView1.DataBind();


        }
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Textbox1.Text = "";
        Textbox2.Text = "";

    }

    protected void Button1_Click(object sender, EventArgs e)
    {


        try
        {

            
            SqlDataSource3.Insert();
            Label3.Text = "新增成功";
            GridView1.DataBind();

            transDate();


        }
        catch
        {
            Label3.Text = "新增失敗,請重試一遍";

        }
        

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}