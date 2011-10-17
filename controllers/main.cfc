<cfcomponent output="false" hint="Example FW/1 controller.">
	
	<cffunction name="init" output="false" hint="Constructor, passed in the FW/1 instance.">
		<cfargument name="fw" />
		<cfset variables.fw = arguments.fw />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="default" output="false" hint="Default action.">
		<cfargument name="rc" />
		<cfset rc.when = now() />
		<cfset variables.fw.service( 'formatter.longdate', 'today' ) />
	</cffunction>
	
	
	<cffunction name="contact" output="false" hint="contact action.">
		<cfargument name="rc" />
		<cfparam name="rc.mail" default="">
		<cfparam name="rc.name" default="">
		<cfparam name="rc.email" default="">
		<cfparam name="rc.website" default="">
		<cfparam name="rc.phone" default="">
		<cfparam name="rc.message" default="">
		<cfparam name="rc.verification" default="">
		<cfscript>
			var local = {};
			var email = new Mail();
			local.errors = ""; 
			if(isDefined("rc.mail") AND rc.mail eq true){
				if(!len(rc.verification)){
					local.errors = listAppend(local.errors,"Please enter a correct verification number.");
				}
				if(rc.verification lt 5 OR rc.verification gt 8){
					local.errors = listAppend(local.errors,"You entered a wrong verification number.");
				}
				if(!len(rc.name)){
					local.errors = listAppend(local.errors,"Please enter your name.");
				}
				if(!len(rc.email)){
					local.errors = listAppend(local.errors,"Please enter your email address");
				}
				if(!len(rc.message)){
					local.errors = listAppend(local.errors,"Please enter a message.");
				}
				if(len(rc.message) lt 20){
					local.errors = listAppend(local.errors,"Please enter a longer message.");
				}
				if(!len(local.errors)){	
					email.setTo("jiggidyuo@gmail.com");//support@wecodethings.com   
					email.setFrom(rc.email);   
					email.setSubject("WeCodeThings Email From " & rc.name);   
					email.setType("html");  
					email.send(body=rc.name & "<br />" & rc.phone & "<br />" & rc.website & "<br /><br />" & rc.message);
				}
				else{
					rc.mail = local.errors;
				}
			}
		</cfscript>
	</cffunction>
	
	
	
</cfcomponent>