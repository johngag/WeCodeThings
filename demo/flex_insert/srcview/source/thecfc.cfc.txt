<cfcomponent>
<cffunction name="insertrecord" access="remote" returntype="void">
	<cfargument name="FirstName" type="string" required="Yes">
	<cfargument name="LastName" type="string" required="Yes">
    <cfquery datasource="mysqlcf_flexdemo">
    	INSERT INTO tblTest (tstFirstName, tstLastName)
		VALUES (<cfqueryparam value="#arguments.FirstName#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.LastName#" cfsqltype="cf_sql_varchar">)	
    </cfquery>
  <cfreturn>
</cffunction>
</cfcomponent>
