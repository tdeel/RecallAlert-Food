<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="RecallFoodAlert.Details" %>

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
                                <img class="img-responsive" alt="Recall Food Alert" src="img/logo.png"/></a>
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

                    <div class="breadcrumbcontainer large-12 medium-12 columns">
                        <ul class="breadcrumbs">
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="Search.aspx">Search Results</a></li>
                            <li class="current"><a href="#">Food Recall Details</a></li>
                        </ul>
                    </div>

                    <div class="large-12 medium-12 small-12 columns">
                        <h1><%= selectedRecall.FirmName  %></h1>
                        <h4>Initiation Date: <%= selectedRecall.InitiationDate.ToString("MM/dd/yyyy") %></h4>
                    </div>

                    <div class="large-9 medium-12 small-12 columns">
                        <div class="detail-box box">
                            <h4>Product Description</h4>
                            <p><%= selectedRecall.ProductDescription %></p>

                            <h4>Distribution</h4>
                            <p><%= selectedRecall.DistPattern %></p>

                            <h4>Product Identification</h4>
                            <p><%= selectedRecall.CodeInfo %></p>

                            <h4>Reason for Recall</h4>
                            <p><%= selectedRecall.RecallReason %></p>
                        </div>

                        <div class="detail-box box">
                            <div class="row">
                                <div class="no-pad-right large-2 medium-2 small-3 columns">
                                    <img id="imgRisk" runat="server" class="risk-level img-responsive" src="img/none.png" />
                                </div>
                                <div class="detail-box-text-area no-pad-left large-10 medium-10 small-9 columns">
                                    <h4>Risk Level: <%= riskLevel %></h4>
                                    <p><%= riskText %></p>
                                </div>
                            </div>
                        </div>

                        <h4>What Should I Do?</h4>

                        <div class="show-for-medium-up">
                            <img class="img-responsive" src="img/should-do.png" />
                        </div>

                        <div class="detail-box box show-for-small-only">
                            <ul>
                                <li class="steps">
                                    <div class="number-one detail-number-icon left"></div>
                                    <div class="detail-box-text">
                                        <h3>Confirm</h3>
                                        <p>product id or lot number</p>
                                    </div>
                                </li>
                                <li class="steps">
                                    <div class="number-two detail-number-icon left"></div>
                                    <div class="detail-box-text">
                                        <h3>Dispose</h3>
                                        <p>of food, retain packaging</p>
                                    </div>
                                </li>
                                <li class="steps">
                                    <div class="number-three detail-number-icon left"></div>
                                    <div class="detail-box-text">
                                        <h3>Contact</h3>
                                        <p>manufacturer or retailer for instructions</p>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <br />
                        <br />
                        <h4>Recall Initiation Date</h4>
                        <p><%= selectedRecall.InitiationDate.ToString("M/d/yy") %></p>

                        <h4>Recall Id</h4>
                        <p><%= selectedRecall.RecallNumber %></p>

                    </div>
                    <div class="detail-sidebar no-pad-left large-3 medium-12 small-12 columns">
                        <div class="detail-recall-box box ">
                            <h2>Recent Recalls</h2>
                            <ul>
                                <li><a href="#">Blue Bell recalls all ice cream - Missouri, Kansas, South Dakota, North Dakota, and Arizona</a></li>
                                <li><a href="#">Good Seed Inc. Recalls Soybean Sprouts and Mung Bean Sprouts - Virginia, Maryland, and New Jersey</a></li>
                                <li><a href="#">United Salad Co. Recalls Champ's Sliced Crimini Mushrooms - Oregon and Washington</a></li>
                            </ul>
                        </div>


                        <div class="detail-alert home-page-alert-box box">
                            <h2>Alerts</h2>
                            <div class="alert-one large-12 medium-6 small-12 columns">
                                <p><a href="TextAlert.aspx">
                                    <img class="alert-icon img-responsive left" src="img/icon_sms.png" />Sign up for text message alerts.</a></p>
                            </div>
                            <div class="alert-two large-12 medium-6 small-12 columns">
                                <p class="alerts-social-text clear">Follow us for alerts.</p>
                                <ul>
                                    <li><a class="facebook-icon social-icon" href="#"></a></li>
                                    <li><a class="twitter-icon social-icon" href="#"></a></li>
                                    <li><a class="rss-icon social-icon" href="#"></a></li>
                                </ul>
                            </div>
                        </div>

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

        <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
  </script>
    </form>
</body>
</html>
