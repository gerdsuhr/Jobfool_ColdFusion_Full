<cfsilent>
    <cfparam name="url.kw" default="">
    <cfparam name="url.l" default="">
    <cfparam name="url.tl" default="A">
    <cfparam name="thistitle" default="Find Jobs" />
    <cfparam name="qrydata.recordcount" default="0" >
    <cfinclude template="../controller/browsejobsbycategory.cfm" />
    <cfinclude template="../controller/browsejobsbylocation.cfm" />
    <cfinclude template="../controller/browsejobsbytitle.cfm" /> 
</cfsilent>
<!--- ================================================================================================================ --->
<!DOCTYPE html> 
<html lang="en"> 
    <head>
        <title>Browse Jobs | TheJobFool.com</title>
        <meta name="description" content="Browse for you perfect job. TheJobFool.com One search thousands of jobs." />
        <meta name="keywords" content="Find a job browse jobs find jobs by title by company by state by category job search tools job search engine jobs career employment search all jobs the job fool thejobfool thejobfool.com" />
        <meta charset="utf-8"> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="../partials/faviconmeta.cfm" />             
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic|Abril Fatface|Oswald:700,400,300|Montserrat:400,700|Open+Sans:400,600,700,800,300italic,400italic,600italic,700italic,800italic|Rokkitt:400,700|Cantarell:400,700|<link Roboto+Slab:400,700,300|Open+Sans:400,800italic,800,700italic,600|Alfa+Slab+One|Play|Bevan">        
        <link rel="stylesheet" href="../assets/css/plugins.css">
        <link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
        <link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../assets/css/app.css">
            
            <STYLE>
                #adcontainer2-16, #adcontainer3-16 {
                    /*overflow:hidden;*/
                }
                #adcontainer2-16 iframe {
                    position: relative;
                    left: -140px;
                }
                
                #adcontainer3-16 iframe {
                    position: relative;
                    left: -140px;
                    top: -20px;
                }
            </STYLE>
</head>
<body class="header-fixed">
<cfinclude template="../partials/googletagmanager.cfm">
        <header> 
            <div class="header header-v6"> 
                <div class="container" data-pg-name="Container-Outer Main"> 
                    <div class="row x-logorow" data-pg-name="Row-Logo bar"> 
                        <div class="navbar-brand"> 
                            <div class="col-xs-12"> 
                                <a class="x-homelink" href="/"> 
                                    <div class="x-text-logo">
                                        <img src="../assets/images/job_search.png" alt="Find a Job" />
                                    </div>                                     
                                </a>                                 
                            </div>                             
                        </div>
                        <!-- Header Inner Right -->
                        <div class="header-inner-right">
                            <!---<ul class="menu-icons-list visible-xs">
                                <li>
                                    <button type="button" class="btn x-siderbar-toggle" data-toggle="offcanvas">
                                        <i class="fa fa-lg fa-navicon"></i>
                                    </button>
                                </li>
                            </ul>--->
                        </div>
                        <!-- End Header Inner Right -->
                    </div>                     
                </div>                 
            </div>             
        </header>
<cfinclude template="../partials/searchform.cfm" />
<section>
<div class="container">
    <div class="row">
        <div class="col-xs-12">

            <div class="tab-v1">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#by-job-location" data-toggle="tab" aria-expanded="true">Jobs By Location</a></li>
                    <li class=""><a href="#by-job-title" data-toggle="tab" aria-expanded="false">Jobs By Job Title</a></li>
                    <li class=""><a href="#by-job-category" data-toggle="tab" aria-expanded="false">Jobs By Category</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="by-job-location">
                        <!--- <cfinclude template="../partials/browse-jobs-bylocation.cfm"> --->
                        <cfswitch expression="#request.co#"> 
                            <cfcase value="GB">
                                <cfinclude template="views/bylocation-UK.cfm" />
                            </cfcase>
                            <cfdefaultcase>
                                <cfinclude template="views/bylocation-US.cfm" />
                            </cfdefaultcase>
                        </cfswitch>
                    </div>
                    <div class="tab-pane fade" id="by-job-title">
                        <div class="row">
                        <div class="col-xs-4 grid x-noPR"> 
                        <a href="../browse-jobs/?tl=a#by-job-title"><button class="btn-primary">A</button></a> 
                        <a href="../browse-jobs/?tl=b#by-job-title"><button class="btn-primary">B</button></a> 
                        <a href="../browse-jobs/?tl=c#by-job-title"><button class="btn-primary">C</button></a> 
                        <a href="../browse-jobs/?tl=d#by-job-title"><button class="btn-primary">D</button></a> 
                        <a href="../browse-jobs/?tl=e#by-job-title"><button class="btn-primary">E</button></a>
                        <a href="../browse-jobs/?tl=f#by-job-title"><button class="btn-primary">F</button></a> 
                        <a href="../browse-jobs/?tl=g#by-job-title"><button class="btn-primary">G</button></a> 
                        <a href="../browse-jobs/?tl=h#by-job-title"><button class="btn-primary">H</button></a> 
                        <a href="../browse-jobs/?tl=i#by-job-title"><button class="btn-primary">I</button></a> 
                        </div>
                        <div class="col-xs-4 grid x-noPR"> 
                        <a href="../browse-jobs/?tl=j#by-job-title"><button class="btn-primary">J</button></a> 
                        <a href="../browse-jobs/?tl=k#by-job-title"><button class="btn-primary">K</button></a> 
                        <a href="../browse-jobs/?tl=l#by-job-title"><button class="btn-primary">L</button></a> 
                        <a href="../browse-jobs/?tl=m#by-job-title"><button class="btn-primary">M</button></a> 
                        <a href="../browse-jobs/?tl=n#by-job-title"><button class="btn-primary">N</button></a> 
                        <a href="../browse-jobs/?tl=o#by-job-title"><button class="btn-primary">O</button></a> 
                        <a href="../browse-jobs/?tl=p#by-job-title"><button class="btn-primary">P</button></a> 
                        <a href="../browse-jobs/?tl=q#by-job-title"><button class="btn-primary">Q</button></a> 
                        <a href="../browse-jobs/?tl=r#by-job-title"><button class="btn-primary">R</button></a> 
                        </div>
                        <div class="col-xs-4 grid  x-noPR"> 
                        <a href="../browse-jobs/?tl=s#by-job-title"><button class="btn-primary">S</button></a> 
                        <a href="../browse-jobs/?tl=t#by-job-title"><button class="btn-primary">T</button></a> 
                        <a href="../browse-jobs/?tl=u#by-job-title"><button class="btn-primary">U</button></a> 
                        <a href="../browse-jobs/?tl=v#by-job-title"><button class="btn-primary">V</button></a> 
                        <a href="../browse-jobs/?tl=w#by-job-title"><button class="btn-primary">W</button></a>
                        <a href="../browse-jobs/?tl=x#by-job-title"><button class="btn-primary">X</button></a> 
                        <a href="../browse-jobs/?tl=y#by-job-title"><button class="btn-primary">Y</button></a> 
                        <a href="../browse-jobs/?tl=z#by-job-title"><button class="btn-primary">Z</button></a> 
                        </div>
                        </div>

                        <div class="row x-PT20">
                            <div class="col-xs-12 x-titles">
                                <cfoutput query="gettitles">
                                    <div class="grid col-lg-3 col-md-3 col-sm-4 col-xs-6 x-noP">
                                    <a class="x-title-item" href="../jobs/?kw=#jobtitle#">#jobtitle#</a>
                                    </div>
                                </cfoutput>
                            </div>
                        </div>

                    </div>
                    
                    <div class="tab-pane fade" id="by-job-category">
                        <div class="row x-PT20">
                            <div class="col-xs-12 x-categories">
                            <cfoutput query="categories">
                                <div class="grid col-lg-3 col-md-3 col-sm-4 col-xs-6 x-noP">
                                    <a href="../jobs/?kw=#category#">#category#</a>
                                </div>
                                </cfoutput>
                            </div>
                        </div>
                    </div>
                </div>
                      
                    
            </div>
        </div>
    </div>  
</section>
<cfinclude template="../partials/footer.cfm" />
    
<script src="../assets/js/jqall.js"></script>
<script src="../assets/js/plugins.js"></script>
<script src="../assets/js/app.js"></script>
<script>
    $(function(){
        App.init();

        // replace spaces with +
        $(".tab-content a").each(function() {
            var text = $(this).attr('href')
            text = text.replace(/ /g, "+");
            $(this).prop('href',text);
        });
        
        $('.nav-tabs').stickyTabs();
        
    });
</script>      
    <!--[if lt IE 9]>
	<script src="../assets/plugins/respond.js"></script>
	<script src="../assets/plugins/html5shiv.js"></script>
	<script src="../assets/plugins/placeholder-IE-fixes.js"></script>
	<![endif]-->  
    
    
        <script type="text/javascript" charset="utf-8">
      (function(G,o,O,g,L,e){G[g]=G[g]||function(){(G[g]['q']=G[g]['q']||[]).push(
       arguments)},G[g]['t']=1*new Date;L=o.createElement(O),e=o.getElementsByTagName(
       O)[0];L.async=1;L.src='//www.google.com/adsense/search/async-ads.js';
      e.parentNode.insertBefore(L,e)})(window,document,'script','_googCsa');
    </script>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
      (adsbygoogle = window.adsbygoogle || []).push({
        google_ad_client: "ca-pub-2780853858393535",
        enable_page_level_ads: true
      });
    </script>
    <cfinclude template="../partials/analytics-combined.cfm">
</body>
</html>