<cfoutput>

<form method="post" action="#cgi.script_name#">
	
	<p>
   		<label for="username">Paypal Username</label>
		<span class="hint">Type here your paypal username</span>
		<span class="field"><input type="text" id="beerMeUsername" name="beerMeUsername" value="#variables.beerMeUsername#" size="20"/></span>
	</p>
	
	<div class="actions">
		<input type="submit" class="primaryAction" value="Submit"/>
		<input type="hidden" value="event" name="action" />
		<input type="hidden" value="showBeerMeSettings" name="event" />
		<input type="hidden" value="true" name="apply" />
		<input type="hidden" value="beerMe" name="selected" />
	</div>

</form>



</cfoutput>