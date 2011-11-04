<cfoutput>

<form method="post" action="#cgi.script_name#">
<fieldset>
<legend>Add feed link</legend>
	<p>
	  <input type="text" id="feedMeTitle" name="feedMeTitle" >
	  Title: #variables.feedMeTitle#
	  </input>
      <br />
      <br />
	  <input type="text" id="feedMefeed" name="feedMefeed" >
	  Current feed: #variables.feedMefeed#
	  </input>
      <br />
      <br />
      <input type="text" id="feedMeNumber" name="feedMeNumber">
      Number: #variables.feedMeNumber#
      </input>
	</p>
</fieldset>
<div class="actions">
    <input type="submit" class="primaryAction" value="Submit"/>
	<input type="hidden" value="event" name="action" />
	<input type="hidden" value="showfeedMeSettings" name="event" />
	<input type="hidden" value="true" name="apply" />
	<input type="hidden" value="feedMe" name="selected" />
  </div>
  
</form>

</cfoutput>
