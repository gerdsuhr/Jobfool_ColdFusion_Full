                <cfparam name="hilite" default="no">
                <cfif results.totalresults GT 0>
                <cfoutput>
                <cfloop array="#results.results#" index="item">                
                    <cfset url.kwlink = trim(Replace(url.kw, " ", "+", "all"))>
                    <cfset item.companylink = trim(Replace(item.company, " ", "+", "all"))>
                    <cfset item.loclink = trim(Replace(item.formattedLocation, " ", "+", "all"))>
                    <cfif structKeyExists(url,'l') and structKeyExists(url, 'cf')>
                        <cfif url.l eq item.formattedLocation><cfset hilite = 'yes'>
                            <cfelse>
                                <cfset hilite = 'no'>
                        </cfif>  
                    </cfif>      
                    <cfset key = item.jobkey> 
                <!--- <cfset key = encrypt(item.jobkey, "foobar", "CFMX_COMPAT", "Base64") /> --->
                    <div class="x-well"> 
                        <p class="x-serptitle"><a href="/jobs/view.cfm?do=1&amp;jobid=#key#" rel="nofollow">#item.jobtitle#</a></p> 
                        <p class="x-serpsnip">#item.snippet#</p>
                        <p class="x-serpcompany"><span<cfif url.kw eq item.company> class="x-matchhilite"</cfif>>#item.company#</span>
                        <cfif len(item.formattedLocationFull)>
                            <span class="x-serplocation" itemtype="http://schema.org/Postaladdress">
                            <cfif len(url.kw) or len(item.company)>- </cfif>
                            <cfif len(url.kw) gt 2><a href="/jobs/index.cfm?kw=#url.kwlink#&l=#item.loclink#"<cfif hilite> class="x-matchhilite"</cfif>>#item.formattedLocationFull#</a>
                            <cfelse>
                                <a href="/jobs/index.cfm?l=#item.loclink#" <cfif hilite> class="x-matchhilite"</cfif>>#item.formattedLocationFull#</a>
                            </cfif> 
                            </span>
                        </cfif>
                        </p>
                        <p>Show me all jobs at <a href="/jobs/index.cfm?kw=#item.company#&l=#item.loclink#">#item.company#</a></p>
                        <p class="x-serppostee"><i>#item.formattedRelativeTime#</i></p>
                       <!--- <p><a class="savejob" id="#key#" href="/jobs/savejob.cfm?jobid=#key#">Save Job</a></p> --->
                    </div>
                </cfloop>
                </cfoutput>  
                </cfif>
 