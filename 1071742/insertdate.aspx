<%@ Page Language="C#" AutoEventWireup="true" CodeFile="insertdate.aspx.cs" Inherits="insertdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>html { box-sizing: border-box; }
*, *::before, *::after { box-sizing: inherit; }



body {
    padding: 20px 0;
}

h1, h2 ,p{
    margin: 0;
    padding: 34px 0 14px 40px;
    text-align:center;

}

nav > ul {
    background-color: #726543;
    list-style: none;   /* 移除項目符號 */
    margin: 0;
    padding: 0;
}

nav a {
    color: inherit; /* 移除超連結顏色 */
    display: block; /* 讓 <a> 填滿 <li> */
    font-size: 1.2rem;
    padding: 10px;
    text-decoration: none;  /* 移除超連結底線 */
}


/* 滑鼠移到 <a> 時變成深底淺色 */
nav li:hover {
    background-color: rgb(115, 115, 115);
    color: white;
}

.flex-nav {
    display: flex;
    justify-content: center;
}

.inline-block-nav {
    text-align: center;
    font-size: 0;   /* 移除 <li> 之間的空隙 */
}

.inline-block-nav > li {
    display: inline-block;
}

footer {
    height: 70px;
    position: relative;
    margin-top: -100px;
    background-color:#42655F;
}


</style>

</head>
<body style="background-color:#DFD5BC;">
    
    <form id="form1" runat="server">
   
       
        <nav>
            <ul class="inline-block-nav">
                <li><a href ="index.aspx"><img src="logo.jpg" width="150" height="70"></img></a></li>
                <li><a href="mypage.aspx">個人頁面</a></li>
                <li><a href="insertdate.aspx">新增行程</a></li>
                <li><a href="editdate.aspx">修改行程</a></li>
                <li><a href="deletedate.aspx">刪除行程</a></li>
                <li><a href="joinaccount.aspx">註冊</a></li>
                <li><a href="Login.aspx">登入</a></li>
            </ul>
        </nav>

         <h2>
           新增行程</h2>
        <div>
            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
           <p> <asp:Label ID="Label2" runat="server" ></asp:Label></p>
            <p> 行程名稱:<asp:TextBox ID="Textbox1" runat="server"></asp:TextBox>
            </p>
            <p> 行程日期:<asp:TextBox ID="Textbox2" runat="server" TextMode="Date"></asp:TextBox>
            </p>
            <p> 
                <asp:Button ID="Button1" runat="server" Text="新增" BackColor="#726543" ForeColor="White" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="清空" BackColor="#726543" ForeColor="White" OnClick="Button2_Click" />
            </p>
            <p> 
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                <asp:Label ID="datename" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dateline" runat="server" Visible="False"></asp:Label>
            </p>
             <p>   <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="schedule_name" HeaderText="schedule_name" SortExpression="schedule_name" />
                        <asp:BoundField DataField="schedule_date" HeaderText="schedule_date" SortExpression="schedule_date" />
                        <asp:BoundField DataField="schedule_dateline" HeaderText="schedule_dateline" SortExpression="schedule_dateline" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </p>
            <p> 
                &nbsp;</p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT [schedule_name], [schedule_date], [schedule_dateline] FROM [s1071742_projectDATE] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="Id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT s1071742_projectDATE.* FROM s1071742_projectDATE  WHERE(Id=@id)" UpdateCommand="UPDATE s1071742_projectDATE SET schedule_dateline = @dateline WHERE (schedule_name=@datename)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="dateline" Name="dateline" PropertyName="Text" />
                    <asp:ControlParameter ControlID="datename" Name="datename" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" InsertCommand="INSERT INTO s1071742_projectDATE(Id, schedule_name, schedule_date) VALUES (@id, @schedule_name, @schedule_date)" SelectCommand="SELECT * FROM [s1071742_projectDATE] WHERE(Id=@id)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Textbox1" Name="schedule_name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Textbox2" Name="schedule_date" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
