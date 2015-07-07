<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="RecallFoodAlert.Search" %>

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

                    <div class="breadcrumbcontainer large-12 medium-12 small-12 columns">
                        <ul class="breadcrumbs">
                            <li><a href="#">Home</a></li>
                            <li class="current"><a href="#">Search</a></li>
                        </ul>
                    </div>

                    <div class="large-12 medium-12 small-12 columns">

                        <div class="home-top row">

                            <div class="recall-search-area large-12 medium-12 small-12 columns">
                                <h1>Food Recalls</h1>

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
                        </div>

                        <div class="sort-container large-12 medium-12 columns">
                            <p>
                                Sort by
            
                                    <select>
                                        <option value="severity">Severity</option>
                                        <option value="option-a">Option A</option>
                                        <option value="option-b">Option B</option>
                                        <option value="option">Option C</option>
                                    </select>
                            </p>
                        </div>

                        <div id="resultsDiv" runat="server">
                        </div>
                    </div>
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
        <asp:ObjectDataSource ID="odsStates" runat="server" SelectMethod="getStateList" TypeName="EccoSelect.com.State"></asp:ObjectDataSource>
        <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
    </form>
</body>
</html>
