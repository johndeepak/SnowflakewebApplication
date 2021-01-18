<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Snowflake.aspx.cs" Inherits="SnowflakewebApplication.Snowflake" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <style type="text/css">
        #grid {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 1200px;
}
        #grid td, #grid th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #grid tr:hover {
            background-color: #ddd;
        }

        #grid th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }

        .buttons {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
        }
  
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div style="max-width: 1200px;">
            <div class="panel panel-default">
                <div class="panel-heading h4 text-primary text-center">
                    Register
                </div>
                <div class="panel-body">




                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="FirstName">First Name</label>
                            <div class="col-sm-5">
                                <asp:TextBox class="form-control" ID="FirstName" placeholder="First Name" runat="server" required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="LastName">Last Name</label>
                            <div class="col-sm-5">
                                <asp:TextBox class="form-control" ID="LastName" placeholder="Last Name" runat="server" required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="Address">Address</label>
                            <div class="col-sm-5">
                                <asp:TextBox class="form-control" ID="Address" placeholder="Address" runat="server" required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <br />


                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-10">
                            <asp:Button CssClass="btn btn-success" ID="Save" OnClick="Save_Click" runat="server" Text="Submit"></asp:Button>
                        </div>


                    </div>
                </div>
            </div>
        </div>


        <asp:Label ID="Ids" runat="server" Visible="false"></asp:Label>
        <br />
        <br />
        <div class="col-sm-12">



            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="Id" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="Id" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Idd" runat="server" Text='<%#Eval("Id")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="FirstName" runat="server" Text='<%#Eval("FirstName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="FirstNamed" runat="server" Text='<%#Eval("FirstName")%>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="LastName" runat="server" Text='<%#Eval("LastName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="LastNamed" runat="server" Text='<%#Eval("LastName")%>'></asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="Address" runat="server" Text='<%#Eval("Address")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="Addressdd" runat="server" Text='<%#Eval("Address")%>'></asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="100px" HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="Edit" runat="server" Text="Edit" CausesValidation="false" OnClick="Edit_Click" formnovalidate="true" />&nbsp;&nbsp;
                          
                             <asp:Button ID="Delete" runat="server" Text="Delete" CausesValidation="false" OnClick="Delete_Click" formnovalidate="true" />
                        </ItemTemplate>


                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
