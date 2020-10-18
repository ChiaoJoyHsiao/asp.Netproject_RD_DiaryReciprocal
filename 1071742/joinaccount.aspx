<%@ Page Language="C#" AutoEventWireup="true" CodeFile="joinaccount.aspx.cs" Inherits="joinaccount" %>

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
             &nbsp;</h2>
        <h2>
            註冊帳號</h2>
        <p>
            &nbsp;</p>
       <p>
            帳號:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </p>
        <p>
            密碼:<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            確認密碼:<asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="確定註冊" OnClick="Button1_Click" style="margin-bottom: 0px" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" InsertCommand="INSERT INTO s1071742_menber(Id, password) VALUES (@Textbox1, @Textbox2)" SelectCommand="SELECT s1071742_menber.* FROM s1071742_menber">
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Textbox1" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Textbox2" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:1082netdbAConnectionString %>" SelectCommand="SELECT [Id] FROM [s1071742_menber] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Visible="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                </Columns>
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
