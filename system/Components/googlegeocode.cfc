<cfcomponent output="false">

<cffunction name="geocode" returnType="struct" output="false">
	<cfargument name="key" type="string" required="true" hint="Google API Key">
	<cfargument name="address" type="string" required="true" hint="Address to look up.">
    <!--- 
	this V2 implemenyation needs to be rebuilt using the new v3 API. This no longer works
	--->
	<cfreturn result>
	<cfset var baseURL = "https://maps.googleapis.com/maps/api/geocode/xml?">
	<cfset var httpResult = "">
	<cfset var xmlResult = "">
	<cfset var result = structNew()>
	
	<!--- Add google key --->
	<cfset baseURL = baseURL & "key=#urlEncodedFormat(arguments.key)#">
	<!--- Add query --->
	<cfset baseURL = baseURL & "&address=#urlEncodedFormat(arguments.address)#">

	<cfoutput>#baseurl#</cfoutput>
	<cfhttp url="#baseURL#" result="httpResult">
    <cfdump var="#httpResult">
    <cfabort>
    
	<cfset xmlResult = xmlParse(httpResult.fileContent)>
	
	<!--- get status --->
	<cfif structKeyExists(xmlResult, "kml") and structKeyExists(xmlResult.kml, "response") and structKeyExists(xmlResult.kml.response, "status")>
		<cfset result.statuscode = xmlResult.kml.response.status.code.xmltext>
		<cfset result.statuscodestring = translateStatusCode(result.statuscode)>
	<cfelse>
		<cfreturn result>
	</cfif>
	
	<cfif result.statusCode neq 200>
		<cfreturn result>
	<cfelse>
		<!--- shift into kml, placemark. Makes later code simpler. --->
		<cfset xmlResult = xmlResult.kml.response.placemark>
	</cfif>
	
	<!--- begin to parse result --->
	<cfset result.originaladdress = arguments.address>
	<cfset result.address = xmlResult.address.xmlText>	
	<cfset result.point = xmlResult.point.coordinates.xmltext>
	<cfset result.longitude = listFirst(result.point)>
	<cfset result.latitude = listGetAt(result.point,2)>
	<cfset result.accuracy = xmlResult.addressdetails.xmlattributes.accuracy>
	<cfset result.accuracystring = translateAccuracy(result.accuracy)>

	<cfif structKeyExists(xmlResult.addressdetails, "country")>

        <cfset result.countrynamecode = xmlResult.addressdetails.country.countrynamecode.xmltext>
			
		<cfif structKeyExists(xmlResult.addressdetails.country, "administrativearea")>
	
			<cfset result.administrativearea = xmlResult.addressdetails.country.administrativearea.administrativeareaname.xmltext>
			<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea, "subadministrativearea")>
				<cfset result.subadministrativearea = xmlResult.addressdetails.country.administrativearea.subadministrativearea.subadministrativeareaname.xmltext>
	
				<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea.subadministrativearea, "locality")>
					<cfset result.subadministrativearealocality = xmlResult.addressdetails.country.administrativearea.subadministrativearea.locality.localityname.xmltext>
	
					<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea.subadministrativearea.locality, "thoroughfare")>
						<cfset result.subadministrativearealocalitythoroughfare = xmlResult.addressdetails.country.administrativearea.subadministrativearea.locality.thoroughfare.thoroughfarename.xmltext>
					</cfif>
	
					<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea.subadministrativearea.locality, "postalcode")>
						<cfset result.subadministrativearealocalitypostalcode = xmlResult.addressdetails.country.administrativearea.subadministrativearea.locality.postalcode.postalcodenumber.xmltext>
					</cfif>
					
				</cfif>
	
				<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea.subadministrativearea, "thoroughfare")>
					<cfset result.subadministrativeareathoroughfare = xmlResult.addressdetails.country.administrativearea.subadministrativearea.thoroughfare.thoroughfarename.xmltext>
				</cfif>
	
				<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea.subadministrativearea, "postalcode")>
					<cfset result.subadministrativeareapostalcode = xmlResult.addressdetails.country.administrativearea.subadministrativearea.postalcode.postalcodenumber.xmltext>
				</cfif>
				
			</cfif>
	
			<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea, "locality")>
				<cfset result.administrativearealocality = xmlResult.addressdetails.country.administrativearea.locality.localityname.xmltext>
				<cfif structKeyExists(xmlResult.addressdetails.country.administrativearea.locality, "postalcodenumber")>
					<cfset result.administrativeareapostalcode = xmlResult.addressdetails.country.administrativearea.locality.postalcode.postalcodenumber.xmltext>
				</cfif>
			</cfif>
			
		</cfif>
	
	</cfif>	
	
	<cfreturn result>
</cffunction>

<cffunction name="translateAccuracy" access="private" output="false" returnType="string"
			hint="Translates an accuracy code to a string.">
	<cfargument name="accuracy" type="numeric" required="true">
	
	<!--- Based on http://www.google.com/apis/maps/documentation/reference.html#GGeoAddressAccuracy --->
	<cfswitch expression="#arguments.accuracy#">
		<cfcase value="0">
			<cfreturn "Unknown location">
		</cfcase>
		<cfcase value="1">
			<cfreturn "Country level accuracy">
		</cfcase>
		<cfcase value="2">
			<cfreturn "Region (state, province, prefecture, etc.) level accuracy">
		</cfcase>
		<cfcase value="3">
			<cfreturn "Sub-region (county, municipality, etc.) level accuracy">
		</cfcase>
		<cfcase value="4">
			<cfreturn "Town (city, village) level accuracy">
		</cfcase>
		<cfcase value="5">
			<cfreturn "Post code (zip code) level accuracy">
		</cfcase>
		<cfcase value="6">
			<cfreturn "Street level accuracy">
		</cfcase>
		<cfcase value="7">
			<cfreturn "Intersection level accuracy">
		</cfcase>
		<cfcase value="8">
			<cfreturn "Address level accuracy">
		</cfcase>
		<cfdefaultcase>
			<cfreturn "Unknown value">
		</cfdefaultcase>
	</cfswitch>

</cffunction>

<cffunction name="translateStatuscode" access="private" output="false" returnType="string"
			hint="Translates a status code to a string.">
	<cfargument name="status" type="numeric" required="true">
	
	<!--- Based on http://www.google.com/apis/maps/documentation/reference.html#GGeoStatusCode --->
	<cfswitch expression="#arguments.status#">
		<cfcase value="200">
			<cfreturn "No errors occurred; the address was successfully parsed and its geocode has been returned.">
		</cfcase>
		<cfcase value="500">
			<cfreturn "A geocoding request could not be successfully processed, yet the exact reason for the failure is not known.">
		</cfcase>
		<cfcase value="601">
			<cfreturn "The HTTP q parameter was either missing or had no value.">
		</cfcase>
		<cfcase value="602">
			<cfreturn "No corresponding geographic location could be found for the specified address. This may be due to the fact that the address is relatively new, or it may be incorrect.">
		</cfcase>
		<cfcase value="603">
			<cfreturn "The geocode for the given address cannot be returned due to legal or contractual reasons.">
		</cfcase>
		<cfcase value="610">
			<cfreturn "The given key is either invalid or does not match the domain for which it was given.">
		</cfcase>
		<cfcase value="620">
			<cfreturn "The given key is gone over request limit or user submitted too many requests in too short a period of time.">
		</cfcase>
		<cfdefaultcase>
			<cfreturn "Unknown value">
		</cfdefaultcase>
	</cfswitch>

</cffunction>

</cfcomponent>