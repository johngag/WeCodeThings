<style type="text/css">
<!--
.tweeterForm{list-style:none;}
.tweeterForm li{ margin:10px;}
input[type=text]{width:225px;}
.hint{font-size:10px;}
-->
</style>

<cfoutput>

<form method="post" action="#cgi.script_name#">

	<fieldset>
		<legend>Offical Twitter Retweet Button</legend>
        
        <ul class="tweeterForm">
            <li>
                <label for="type">Type of Button:</label><br />
                <input type="radio" name="type" value="none" <cfif getSetting("type") is "none"> checked="checked"</cfif> />None
                <input type="radio" name="type" value="vertical" <cfif getSetting("type") is "vertical"> checked="checked"</cfif> />Vertical
                <input type="radio" name="type" value="horizontal" <cfif getSetting("type") is "horizontal"> checked="checked"</cfif> />Horizontal 
            </li>        
			<li>
            	<label for="referrer">Referring User:</label><br />
                <input type="text" name="referrer" value="#getSetting('referrer')#" /><br />
                <p class="hint">User that appears in retweet. IE: @wris_oh</p>
            </li>        
            <li>
            	<label for="referrer">Tweet Text:</label><br />
                <input type="text" name="tweetTxt" value="#getSetting('tweetTxt')#" /><br />
                <p class="hint">Text that appears in the retweet. IE: Click Here!</p>
            </li>
		</ul>
		
	</fieldset>
		
	<p class="actions">
		<input type="submit" class="primaryAction" value="Submit"/>
		<input type="hidden" value="event" name="action" />
		<input type="hidden" value="showTwitterRetweetSettings" name="event" />
		<input type="hidden" value="true" name="apply" />
		<input type="hidden" value="twitterRetweet" name="selected" />
	</p>

</form>



</cfoutput>

