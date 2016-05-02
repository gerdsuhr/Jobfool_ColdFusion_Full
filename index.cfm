<cfsilent>
        <!---==== recent queries section ===== --->
        <cftry>
        <cfquery name="data" datasource="#request.dsn#" username="#request.dbuser#" password="#request.dbpass#" cachedwithin="#createTimespan(0,0,30,0)#">
            SELECT TOP 200 [keyword],[location]  
            FROM [thejobfool].[dbo].[RecentQueries]
            order by datetime desc
        </cfquery>
        <cfcatch></cfcatch>
        </cftry>
</cfsilent>


<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> 
<html lang="en"> 
    <!--<![endif]-->
    <head>
        <title>Job Search</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="favicon.ico">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic|Abril Fatface|Oswald:700,400,300|Montserrat:400,700|Open+Sans:400,600,700,800,300italic,400italic,600italic,700italic,800italic|Rokkitt:400,700|Cantarell:400,700|<link Roboto+Slab:400,700,300|Open+Sans:400,800italic,800,700italic,600|Alfa+Slab+One|Play|Bevan">
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/offcanvas.css">
        <link href="assets/css/grid-ms.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/app.css">
        <!--<link rel="stylesheet" href="assets/css/u-dark-blue.css">-->
        <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/plugins/image-hover/css/img-hover.css">
        <link rel="stylesheet" href="assets/plugins/animate.css">
        <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css">
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/plugins/animated-headline/css/animated-headline.css">
        <style>
            /* for validation */
            .has-error .form-control {
                border: 1px solid #FF486F;
                background-color: rgba(255, 72, 111, 0.24);
            }
            

            
            x-listbox {
                width: 80%;
                margin:0 auto;
            }
            .simple-item {
                color: #555;
                display: inline-block;
                font-size: 16px;
                font-weight: normal;
                margin: 0 10px;
                overflow: hidden;
                padding: 5px 10px;
                text-overflow: ellipsis;
                white-space: nowrap;
                width: calc(33% - 20px);
                text-align:center;
            }
        </style>
    </head>
    <body class="x-home header-fixed">
        <div class="wrapper">
            <!---=== Header v6 ===--->
            <div class="header-v6 header-dark-transparent header-sticky">
                <!--- Navbar --->
                <div class="navbar mega-menu" role="navigation">
                    <div class="container">
                        <div class="menu-container">
                            <!--- Navbar Brand --->
                            <div class="navbar-brand">
                                <div class="col-xs-12 homelogo">
                                    <a class="x-homelink" href="/">
                                        <div class="x-text-logo">
                                            <h1 title="Job Search"><span class="x-job">JOB</span><span class="x-fool">FOOL</span></h1>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!-- ENd Navbar Brand -->
                            <!-- Header Inner Right -->
                            <div class="header-inner-right">
                                <!---
                                    <ul class="menu-icons-list">
                                    <li>
                                        <button type="button" class="btn x-siderbar-toggle" data-toggle="offcanvas">
                                            <i class="fa fa-lg fa-navicon"></i>
                                        </button>
                                    </li>
                                </ul>
                                --->
                            </div>
                            <!--- End Header Inner Right --->
                        </div>
                        <!--- Collect the nav links, forms, and other content for toggling --->
                        <div class="collapse navbar-collapse navbar-responsive-collapse">
                            <div class="menu-container">
                                <!--- 
                                <ul class="nav navbar-nav">
                                    <li class="dropdown active">
                                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
										LINK</a>
                                    </li>
                                    <li class="dropdown active">
                                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
										LINK</a>
                                    </li>
                                    <li class="dropdown active">
                                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
										LINK</a>
                                    </li>
                                </ul>
                                --->
                            </div>
                        </div>
                        <!---/navbar-collapse--->
                    </div>
                </div>
                <!--- End Navbar --->
            </div>
            <!---=== End Header v6 ===--->
            <!--- Interactive Slider v2 --->
            <section class="x-searchbar-home"> 
                <div class="interactive-slider-v2 interactive-slider-v2-md img-v3">
                    <div class="container">
                        <h1 class="x-headline">Find Your Perfect Job Today</h1>
                        <p class="x-sub">Find millions of local jobs from one place</p>
                        <div class="row" data-pg-name="Row-Searchbar"> 
                            <form method="get" action="/jobs/"> 
                                <div class="col-sm-5 x-reducepad-5"> 
                                    <div class="input-group"> 
                                        <span class="input-group-addon"><i class="fa fa-lg fa-tag x-blue"></i></span> 
                                        <input type="text" name="kw" id="x-what" placeholder="what job you are looking for" class="form-control x-what">
                                    </div>                                     
                                </div>                                 
                                <div class="col-sm-5 x-reducepad-5"> 
                                    <div class="input-group"> 
                                        <span class="input-group-addon"><i class="fa fa-lg fa-map-marker x-red"></i></span> 
                                        <input type="text" name="l" id="x-where" placeholder="where would you like to work" class="form-control x-where"> 
                                    </div>                                     
                                </div>                                 
                                <div class="col-sm-2 x-reducepad-5"> 
                                    <button id="x_search-form" class="form-control inline-block btn-primary x-search-btn">Find a Job</button>                 
                                </div>                                 
                            </form>                             
                        </div>                         
                    </div>
                </div>
            </section>
            <!--- End Interactive Slider v2 --->
            <section class="bg-color-light">
            <div class="container">
            <div class="row service-box-v1 wow fadeInUp animated">
                <div class="col-md-4 col-sm-6 md-margin-bottom-40">
					<div class="service-block service-block-default no-margin-bottom">
						<i class="icon-lg rounded-x icon icon-badge"></i>
						<h2 class="heading-sm">Popular Employers</h2>
						<cfset empArray = ["Google","General Electric", "Chipotle", "Wal-Mart", "Starbucks", "Boeing"] />
						<ul class="list-unstyled">
							<cfoutput><cfloop array="#empArray#" index="item"><cfset itemlink = replace(item," ","+","all") />                         <li><a href="/jobs/?kw=#itemlink#">#item#</a></li>
                            </cfloop></cfoutput>
						</ul>
					</div>
				</div>
                <div class="col-md-4 col-sm-6 md-margin-bottom-40">
					<div class="service-block service-block-default no-margin-bottom">
						<i class="icon-lg rounded-x icon-line rounded-x icon-directions"></i>
						<h2 class="heading-sm">Popular Cities</h2>
						<cfset cityArray = ["Chicago","San Francisco", "New York City", "Atlanta", "Denver", "Miami"] />
						<ul class="list-unstyled">
                        <cfoutput><cfloop array="#cityArray#" index="item"><cfset itemlink = replace(item," ","+","all") />
                        <li><a href="/jobs/?kw=#itemlink#">#item#</a></li>
                        </cfloop></cfoutput>
						</ul>
                    </div>
				</div>
                
				<div class="col-md-4 col-sm-12 md-margin-bottom-40">
					<div class="service-block service-block-default no-margin-bottom">
						<i class="icon-lg rounded-x icon-line rounded-x icon-layers"></i>
						<h2 class="heading-sm">Popular Categories</h2>
						<cfset catArray = ["Inside Sales","Certified Registered Nurse", "Internship", "Certified Account", "GIS", "Work From Home"] />
						<ul class="list-unstyled">
                        <cfoutput><cfloop array="#catArray#" index="item"><cfset itemlink = replace(item," ","+","all") />
                        <li><a href="/jobs/?kw=#itemlink#">#item#</a></li>
                        </cfloop></cfoutput>
						</ul>
                    </div>
				</div> 
            </div>
            </div>
            </section>
            <!--=== Subscribe Form ===-->
            <div class="shop-subscribe bg-color-red">
                <div class="container">
                    <div id="emailform" class="row">
                        <div class=" col-xs-12">
                            <h2>Send me great new <strong>jobs by email</strong></h2>
                        </div>
                        <form id="alert"  role="form">
                        <div class="col-xs-4 x-reducepad-5 form-group">
                            <input type="text" class="form-control" id="what" name="what" min-length="3" placeholder="What Job" required>
                        </div>
                        <div class="col-xs-4 x-reducepad-5 form-group">
                            <input type="text" class="form-control" id="where" name="where" min-length="3" placeholder="What city or zipcode" required>
                        </div> 
                        <div class="col-xs-4 x-reducepad-5 input-group form-group">
                            <input type="email" class="form-control" id="email" name="email" placeholder="enter email address" required>
                            <span class="input-group-btn form-group">
                                <button id="alertbtn" class="btn" type="submit">
                                    <i class="fa fa-envelope-o"></i>
                                </button>
                            </span>
                            </div>
                        </div>
                        
                            <input type="hidden" class="form-control" name="cfid" value="homepage">
                        </form>
                        </div>   
                    </div>
                </div>
            </div><!--- /end container --->
            <!--- === Subscribe Form === --->
    
            <!--- === Hire Block === --->
            <div class="x-hire bg-color-light hidden-xs hidden-">
                <div class="container content-sm">
                    
                    <!---<img class="img-responsive img-center" src="assets/img/map-img-v1.png" alt="">--->
                <ul class="list-inline our-clients wow fadeInUp animated" id="effect-2">
				<li>
					<figure>
						<img src="assets/img/clients2/ea-canada.png" alt="Ea Canada">
						<div class="img-hover">
							<h4>Ea Canada</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/general-electric.png" alt="General Electric">
						<div class="img-hover">
							<h4>General Electric</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/ucweb.png" alt="UcWeb">
						<div class="img-hover">
							<h4>UcWeb</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/images/companylogos/deltaairlines140.png" alt="Delta Airlines">
						<div class="img-hover">
							<h4>Delta Airlines</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/corepreserves.png" alt="Core Preserves">
						<div class="img-hover">
							<h4>Core Preserves</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/images/companylogos/mcdonalds140.png" alt="McDonalds">
						<div class="img-hover">
							<h4>McDonalds</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/images/companylogos/dish_network140.png" alt="Dish Network">
						<div class="img-hover">
							<h4>Dish Network</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/baderbrau.png" alt="">
						<div class="img-hover">
							<h4>Baderbrau</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/emirates.png" alt="">
						<div class="img-hover">
							<h4>Emirates</h4>
						</div>
					</figure>
				</li>
                <li>
					<figure>
						<img src="assets/images/companylogos/subway140.png" alt="Subway">
						<div class="img-hover">
							<h4>Subway</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/fddw.png" alt="Field Days">
						<div class="img-hover">
							<h4>Field Days</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/images/companylogos/fedex140.png" alt="FEDEX">
						<div class="img-hover">
							<h4>Federal Express</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/marianos.png" alt="">
						<div class="img-hover">
							<h4>Mariano's</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/grifting-tree.png" alt="The Gifting Tree">
						<div class="img-hover">
							<h4>The Gifting Tree</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/jaguar.png" alt="Jaguar">
						<div class="img-hover">
							<h4>Jaguar</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/hermes.png" alt="">
						<div class="img-hover">
							<h4>Hermes</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/img/clients2/starbucks.png" alt="Starbucks">
						<div class="img-hover">
							<h4>Starbucks</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="assets/images/companylogos/chipotle140.png" alt="Chipotle">
						<div class="img-hover">
							<h4>Chipotle</h4>
						</div>
					</figure>
				</li>
			</ul>
            </div>
        </div>
        <!--- === End Hire Block === --->

                <cfsilent>
        <!---==== recent queries section ===== --->
        <cfquery name="data" datasource="#request.dsn#" username="#request.dbuser#" password="#request.dbpass#" cachedwithin="#createTimespan(0,0,0,0)#">
            SELECT TOP 200 [keyword],[location]  
            FROM [thejobfool].[dbo].[RecentQueries]
            order by datetime desc
        </cfquery>
        </cfsilent>
  
        <div class="container">
            <div class="row">
                <div id="recentqueries" class="mobile-hidden">
                <cfoutput query="data">
                    <a class="small" href="/jobs/?kw=#keyword#<cfif len(location) gt 5>&l=#location#</cfif>" title="Job Search">#lcase(keyword)#</a>
                </cfoutput>
                </div>
            </div>
        </div>


        <cfinclude template="partials/footer.cfm">

        </div>

        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>-->
        <script src="assets/plugins/jquery/jquery223.min.js"></script>
        <script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
        <script src="assets/plugins/jquery/additional-methods.js"></script>
        <script src="assets/plugins/jquery/jquery.validate.js"></script>"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/back-to-top.js"></script>
        <script src="assets/plugins/smoothScroll.js"></script>
        <script src="assets/plugins/jquery.parallax.js"></script>
        <script src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
        <script src="assets/plugins/counter/waypoints.min.js"></script>
        <script src="assets/plugins/counter/jquery.counterup.min.js"></script>
        <script src="assets/plugins/wow-animations/js/wow.min.js"></script>
        <script src="assets/plugins/animated-headline/js/animated-headline.js"></script>         
        <script src="assets/plugins/animated-headline/js/modernizr.js"></script>
 
        <script src="assets/js/unify-app.js"></script>

        <script type="text/javascript">
        jQuery(document).ready(function() {
            App.init();
            new WOW().init();
            App.initCounter();
            App.initParallaxBg(); 
            
            // search form placeholder fix
            $('input').focus(function(){
               $(this).data('placeholder',$(this).attr('placeholder'))
                   .attr('placeholder','');
            }).blur(function(){
               $(this).attr('placeholder',$(this).data('placeholder'));
            });
            
            
            if( $("#alert").find(".error").length){
                alert("errors found");
            }
            
            
    $("#alert").validate({
        ignore: ":hidden",
         rules: {   },
            
        submitHandler: function (form) {
             
             $.ajax({
                type: "POST",
                dataType:"json",
                url: "/controller/addalert.cfm",
                data: $(this).serialize()
            }).done(function(){
                $('#emailform').html(
                    "<div class='col-xs-12'><h2>Sweet! You're almost Done.</h2><p>To activate your job alert, please check your email and click the confirmation button .</p></div>");
            }).fail(function(){
                      $('#emailform').html(
                    "<div class='col-xs-12'><h2>Sorry for the Inconvenience.</h2><p>The email alert sytems in under going maintenance.</p></div>");
            });
            return false;   
             
         }
    });
            
            
            
        }); <!--- end doc ready --->
            
        $('#x_search-form').submit(function(e){
          e.preventDefault();
        });
      
        </script>
        <!--[if lt IE 9]>
	<script src="assets/plugins/respond.js"></script>
	<script src="assets/plugins/html5shiv.js"></script>
	<script src="assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->
    </body>
</html>
