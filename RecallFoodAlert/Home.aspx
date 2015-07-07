<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RecallFoodAlert.Home" %>

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
                            <a class="logo" href="Home.aspx">
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
                    <div class="large-9 medium-12 small-12 columns">

                        <div class="home-top row">

                            <div class="grocery-store large-6 medium-6 small-12 columns">
                                <img class="grocery-store-img img-responsive" src="img/img_GroceryStore.jpg" />
                            </div>

                            <div class="recall-search-area no-pad-left large-6 medium-6 small-12 columns">
                                <h1>Are there food recalls in my area?</h1>
                                <p>Powered by the FDA's recall database, Recall Alert - Food Safety allows consumers to easily search for food recall information in a given geographic area.</p>

                                <div class="search-bar row collapse">
                                    <div class="search-bar-input-div large-8 medium-8 small-8 columns">
                                        <asp:TextBox runat="server" ID="inputSearch" placeholder="Search by Food or Brand" CssClass="search-bar-input"></asp:TextBox>
                                    </div>
                                    <div class="optional-text-container large-4 medium-4 small-4 end columns">
                                        <p class="optional-text">*Optional</p>
                                    </div>

                                    <div class="states-container large-8 medium-8 small-8 columns">
                                            <asp:DropDownList ID="cmbState" runat="server"
                                                DataSourceID="odsStates" DataTextField="Name" DataValueField="Abbreviation">
                                            </asp:DropDownList>
                                    </div>

                                    <div class="submit-img-container large-4 medium-4 small-4 end columns">
                                    <asp:ImageButton runat="server" ID="searchButton" CssClass="submit-img" ClientIDMode="Static" 
                                        ImageUrl="~/img/btn_Search.jpg"
                                        BorderStyle="None"
                                        OnClick="searchButton_Click" />
                                    </div>

                                </div>
                            </div>
                        <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="false" Text=""></asp:Label>

                        </div>
                        <div class="home-bottom row">

                            <div class="show-for-small-only small-12 columns">
                                <p class="alert-box-small">
                                    <a href="TextAlert.aspx">
                                        <img class="alert-icon img-responsive left" src="img/icon_sms.png" />Sign up for text message alerts.</a>
                                </p>
                            </div>

                            <div class="large-8 medium-8 small-12 columns">
                                <div class="recall-box box ">
                                    <h2>Recent Recalls</h2>
                                    <ul>
                                        <li><a href="#">Blue Bell recalls all ice cream - Missouri, Kansas, South Dakota, North Dakota, and Arizona</a></li>
                                        <li><a href="#">Good Seed Inc. Recalls Soybean Sprouts and Mung Bean Sprouts - Virginia, Maryland, and New Jersey</a></li>
                                        <li><a href="#">United Salad Co. Recalls Champ's Sliced Crimini Mushrooms - Oregon and Washington</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="no-pad-left show-for-medium-up large-4 medium-4 columns">
                                <div class="home-page-alert-box box">
                                    <h2>Alerts</h2>
                                    <p>
                                        <a href="TextAlert.aspx">
                                            <img class="alert-icon img-responsive left" src="img/icon_sms.png" />Sign up for text message alerts.</a>
                                    </p>

                                    <p class="alerts-social-text clear">Follow us for alerts.</p>
                                    <ul>
                                        <li><a class="facebook-icon social-icon" href="#"></a></li>
                                        <li><a class="twitter-icon social-icon" href="#"></a></li>
                                        <li><a class="rss-icon social-icon" href="#"></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                    </div>

                    <aside class="no-pad-left show-for-large-up large-3 columns">
                        <div class="recall-alert-websites box">
                            <h2>Other Recall Alert Websites</h2>
                            <ul class="other-websites-ul">
                                <li>
                                    <a href="#">
                                        <span class="rx-icon icon left"></span>
                                        <span class="other-website-text left">Recall Alert:<br />
                                            Drug Safety</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="cow-icon icon left"></span>
                                        <span class="other-website-text left">Recall Alert:<br />
                                            Animal Health</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="dna-icon icon left"></span>
                                        <span class="other-website-text left">Recall Alert:<br />
                                            Biologics</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="syringe-icon icon left"></span>
                                        <span class="other-website-text left">Recall Alert:<br />
                                            Medical Devices</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="lipstick-icon icon left"></span>
                                        <span class="other-website-text left">Recall Alert:<br />
                                            Cosmetics</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </aside>

                </div>
            </section>

            <footer class="clear">
                <div class="row">
                    <div class="large-12 medium-12 small-12 columns">
<%--                        <p class="copyright left">Copyright &copy; 2015 Recall Alert - Food Safety. All Rights Reserved.</p>--%>
                    </div>
                </div>
            </footer>
        </div>

        <asp:ObjectDataSource ID="odsStates" runat="server" SelectMethod="getStateList" TypeName="EccoSelect.com.State" ></asp:ObjectDataSource>
        <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
 
            $(document).ready(function(){
                $('#TextBoxId').keypress(function(e){
                    if(e.keyCode==13)
                        $('#linkadd').click();
                });
            });
 
</script>
    </form>
</body>
</html>
