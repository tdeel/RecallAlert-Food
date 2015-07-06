<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TextAlert.aspx.cs" Inherits="RecallFoodAlert.TextAlert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Recall Alert - Food Safety</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/stylesheet.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,400italic,700italic' rel='stylesheet' type='text/css' />
    <link type="text/css" rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css" />
    <script src="js/vendor/modernizr.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <header>
                <div class="row">
                    <div class="header-row large-12 medium-12 small-12 columns">
                        <div class="logo-container left">
                            <a class="logo" href="index.html">
                                <img class="img-responsive" alt="BabySafe Rx" src="img/logo.png" /></a>
                        </div>

                        <div class="open-fda-container left">
                            <p>
                                <span class="powered-by">Powered by </span>
                                <a class="open-fda" href="https://open.fda.gov/" target="_blank">
                                    <img class="img-responsive" alt="Open FDA" src="img/logo-open-fda.png" /></a>
                            </p>
                        </div>
                    </div>
                </div>
            </header>

            <section class="content">
                <div class="content-row row">
                    <div class="large-12 medium-12 small-12 columns">

                        <div class="large-12 medium-12 small-12 columns">
                            <h1>Food Recall Text Alert Sign Up</h1>
                            <p>Please send me text message alerts at the number below for recalls that interest me.</p>

                            <div class="search-bar row collapse">
                                <div class="search-bar-input-div large-12 medium-12 small-12 columns">
                                    <asp:TextBox ID="txtMobilePhone" runat="server" placeholder="Enter Mobile Phone Number"></asp:TextBox>
                                </div>

                                <div class="states-container large-12 medium-12 small-12 columns">
                                    <asp:DropDownList ID="cmbState" runat="server"
                                        DataSourceID="odsStates" DataTextField="Name" DataValueField="Abbreviation">
                                    </asp:DropDownList>
                                </div>

                                <div class="alerts-text-container large-12 medium-12 small-12 columns">
                                    <asp:DropDownList ID="lstAlertTypes" runat="server">
                                        <asp:ListItem Value="all" Text="All Alert Types"></asp:ListItem>
                                        <asp:ListItem Value="type-a" Text="Alert Type A"></asp:ListItem>
                                        <asp:ListItem Value="type-b" Text="Alert Type B"></asp:ListItem>
                                        <asp:ListItem Value="type-c" Text="Alert Type C"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="search-bar-input-div large-12 medium-12 small-12 columns">
                                    <asp:TextBox ID="txtFoodBrand" runat="server" placeholder="Enter Food or Brand (Optional)"></asp:TextBox>
                                </div>

                                <p>I understand that I can text "S" to 40938 to stop these alerts at any time.</p>

                                <div class="large-12 medium-12 small-12 end columns">
                                    <a class="text-cancel left" href="#">
                                        <img src="img/btn_Cancel.jpg" /></a>
                                    <input class="signup-img right" type="submit" alt="Submit" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <footer class="clear">
                <div class="row">
                    <div class="large-12 medium-12 small-12 columns">
                        <p class="copyright left">Copyright &copy; 2015 Recall Alert - Food Safety. All Rights Reserved.</p>
                    </div>
                </div>
            </footer>
        </div>

        <asp:ObjectDataSource ID="odsStates" runat="server" SelectMethod="getStateList" TypeName="EccoSelect.com.State"></asp:ObjectDataSource>

        <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
</script>
    </form>
</body>
</html>
