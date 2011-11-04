<!--- 

Joel Hill
www.WeCodeThings.com
jiggidyuo@yahoo.com

--->

<!--- Script can be a scheduled task or ran when the user requests it --->

<!--- This script works only with NFL and NCAA Football --->

<!--- Things that might be useful that I know about the String that comes from ESPN for NFL and NCAA Football --->
<!---
1.  When the game is over, the matchArray[i].matchDate = "FINAL" OR  NEQ "FINAL - OT"
2.  When the game is at halftime, the matchArray[i].matchDate = "HALFTIME"
3.  These are the only times when matchArray[i].matchDate is not a date, but a string
4.  The URL string is updated ever 120 seconds
5.  NBA, NHL are a little more tricky because it lists some stats after the game 
    (Anybody who decides to parse these, please let me know. I don't have the need right now
    but I would like to have the code
--->

<!--- Known ESPN URL STRINGS --->
<!---
NFL:            http://sports.espn.go.com/nfl/bottomline/scores
NBA:            http://sports.espn.go.com/nba/bottomline/scores
MLB:            http://sports.espn.go.com/mlb/bottomline/scores
NHL:            http://sports.espn.go.com/nhl/bottomline/scores
NCAA Football:  http://sports.espn.go.com/ncf/bottomline/scores
GOLF:           http://sports.espn.go.com/sports/golf/bottomLineGolfLeaderboard
Nascar:         http://sports.espn.go.com/rpm/bottomline/race
WNBA:           http://sports.espn.go.com/wnba/bottomline/scores
ESPN Headlines: http://sports.espn.go.com/espn/bottomline/news
--->

<!--- To debug, try removing the cftry's --->
<!--- Set to false to hide the string and url --->
<cfset ShowNFLEspnString = false>

<!--- Set to false to hide the dump of the games --->
<cfset ShowGameDump = false>

<!--- Set to false to hide the Pass | Fail Message  --->
<cfset ShowPassFail = false>

<!--- And away... We... GO! --->
<cftry>
    
<!--- Lets do NFL --->    
<cfset espn = "http://sports.espn.go.com/nfl/bottomline/scores">
		
<cfhttp url="#espn#" method="get" resolveurl="yes" throwonerror="yes" />
<cfset myArray = arrayNew(1) />
<cfset myResult = #CFHTTP.FileContent# />

<cfif ShowNFLEspnString EQ true>
	<cfoutput>
    <br />
    ESPN NFL String URL: <a href="#espn#">#espn#</a><br />
    <br />
    #myResult#<br />
    <br />
    </cfoutput>
</cfif>

<cfset j = 1 />
<!---parse the urls, don't touch :)--->
<cfset newResult = #REReplace(myResult, "%20%20", "@", "all")# />
<cfset newResult = #REReplace(newResult, "%20", " ", "all")# />
<cfset newResult = #REReplace(newResult, "%26", "", "all")# />
<cfset newResult = #REReplace(newResult, "[(][0-9][)]", "", "all")# />
<cfset newResult = #REReplace(newResult, "[(][0-9][0-9][)]", "", "all")# />
<cfset newResult = #REReplace(newResult, "[(][A-Z][A-Z][)]", "", "all")# />
<cfset newResult = #REReplace(newResult, "\^", "", "all")# />
<cfset newResult = #REReplace(newResult, "[ \t][a-z][a-z][ \t]", "@", "all")# />
<cfset newResult = #REReplace(newResult, "[(]", "@(", "all")# />
<cfset newResult = #REReplace(newResult, "[()]", "", "all")# />

<!---loop over the urls and store the teams in a array--->
<cfloop list="#newResult#" index="i" delimiters="#chr(38)#">
    <!--- Sometimes espn has a item with no teams or scores --->
    <!--- If this is the case, a try catch will keep the loop going so it doesn't crash --->
    <cftry>
		<cfset myArray[j] = listgetat("#i#", 2, "=") />
        <cfset j = j + 1 />
    <cfcatch>
    	<!--- Don't care what the extra garbage is --->
    </cfcatch>
    </cftry>
</cfloop>

<cfset gamesArray = arrayNew(1) />
<cfset j = 1 />

<cfloop from="3" to="#arraylen(myArray)#" index="m" step="3">
    <cfset gamesArray[j] = #myArray[m]# & "&"  />
    <cfset j =  j + 1 />
</cfloop>

<!---remove garbage character at the end of the array--->
<cfset delete = #arrayDeleteAt(gamesArray, j-1)# />

<!---turn the array back into a list for fun :)--->
<cfset breakUp = #arrayToList(gamesArray,"")# />
<cfset matchArray = arrayNew(1) />
<cfloop list="#breakUp#" index="z" delimiters="#chr(38)#">
    <cftry>
		<cfset matchup = structNew() />
        <cfset matchup.teamOne = trim(listgetat("#z#", 1, "@")) />
         
        <!--- Get the score start and end places --->
        <cfset teamOneScoreStringStart = #findoneof("0123456789",matchup.teamOne)#>
        <cfset teamOneScoreStringEnd = #LEN(matchup.teamOne)#>
        
        <!--- Team 1 Score --->
        <cfif teamOneScoreStringStart EQ 0>
            <cfset matchup.teamOneScore = 0>
        <cfelse>
            <cfset matchup.teamOneScore =#Mid(matchup.teamOne,teamOneScoreStringStart,teamOneScoreStringEnd)#>
        </cfif>
        <!--- Remove Score from teamOne String --->
        <cfif teamOneScoreStringStart NEQ 0>
            <cfset teamOneScoreStringStart = teamOneScoreStringStart - 1>
            <cfset matchup.teamOne = #Mid(matchup.teamOne,1,teamOneScoreStringStart)#>
        </cfif> 
                
        <cfset matchup.teamTwo = trim(listgetat("#z#", 2, "@")) />
        
        <!--- Get the score start and end places --->
        <cfset teamTwoScoreStringStart = #findoneof("0123456789",matchup.teamTwo)#>
        <cfset teamTwoScoreStringEnd = #LEN(matchup.teamTwo)#>
        
        <!--- Team 2 Score --->
        <cfif teamTwoScoreStringStart EQ 0>
            <cfset matchup.teamTwoScore = 0>
        <cfelse>
            <cfset matchup.teamTwoScore =#Mid(matchup.teamTwo,teamTwoScoreStringStart,teamTwoScoreStringEnd)#>
        </cfif>
        <!--- Remove Score from teamTwo String --->
        <cfif teamTwoScoreStringStart NEQ 0>
            <cfset teamTwoScoreStringStart = teamTwoScoreStringStart - 1>
            <cfset matchup.teamTwo = #Mid(matchup.teamTwo,1,teamTwoScoreStringStart)#>
        </cfif> 
     
     	<cfset matchup.matchDate = trim(listgetat("#z#", 3, "@")) />
     
    <cfcatch>
    	<!--- Don't care, just make sure it doesn't crash --->
    </cfcatch>
    </cftry>
        
    <cfset arrayAppend(matchArray,matchup) />
    
</cfloop>

<!--- LETS SEE OUR LIVE SCORES!!!! --->
<cfif ShowGameDump EQ true>
	<cfdump var="#matchArray#" />
</cfif>    

<!--- Ok lets do something with our live scores, loop through the array and add total score --->
<!--- This will be our new array to hold our information --->
<cfset matchInfoArray = arrayNew(1)>				
<cfloop from="1" to="#arraylen(matchArray)#" index="i">

	<cfset matchupinfo = structNew() />
        
	<!--- Set MATCHDATE --->
    <cfset matchupinfo.matchdate = matchArray[i].matchdate>
    
    <!--- Set TOTAL POINTS --->
    <cfif isnumeric(matchArray[i].teamonescore) AND isnumeric(matchArray[i].teamtwoscore)>
        <cfset matchupinfo.total = (matchArray[i].teamonescore + matchArray[i].teamtwoscore)>
    <cfelse>
        <cfset matchupinfo.total = 0>
    </cfif>
    
    <!--- Set TEAM ONE --->
    <cfset matchupinfo.teamOne = matchArray[i].teamOne />
    
    <!--- Set TEAM ONE SCORE --->
    <cfset matchupinfo.teamOneScore = matchArray[i].teamonescore />
    
    <!--- Set TEAM TWO --->
    <cfset matchupinfo.teamTwo = matchArray[i].teamTwo />
    
    <!--- Set TEAM ONE SCORE --->
    <cfset matchupinfo.teamTwoScore = matchArray[i].teamtwoscore />
    
    <!--- Add game info to the array --->
	<cfset arrayAppend(matchInfoArray,matchupinfo) />
    
</cfloop>

<cfif ShowPassFail EQ true>
	<font size="2" style="color:green;">Live Scoring Template Updated Successfully </font><br /><br /><br /><br />
</cfif>    
<cfset variables.UpdatePassed = true>

<cfcatch type="any">
	<!--- If something went wrong, lets let display an error message and dump the catch --->
    <cfif ShowPassFail EQ true>
		<font size="2" style="color:red;">Live Scoring Template Failed to Update </font><br />
    </cfif>    
	<cfset variables.UpdatePassed = false>
	<cfdump var="#cfcatch#">
</cfcatch>

</cftry>


<!--- Lets make the display a little nicer :) --->
<table width="100%" border="1">

<tr align="center">
	<td>
    	Team 1
    </td>
    <td>
    	Game Info
    </td>
    <td>
    	Team 2
    </td>
</tr>

<cfloop from="1" to="#arraylen(matchInfoArray)#" index="i">

<cfoutput>
	 
    <tr>
		<td width="40%" align="left">
        	<table border="0" width="100%">
            	<tr> 	
                    <td align="center" width="60%">
                        <font size="4">
                        	#matchInfoArray[i].teamOne# 
                         </font>
                    </td>
                    <td align="right">
                        <font size="6">
                        #matchInfoArray[i].teamOneScore# &nbsp;
                       	</font>
                    </td>
                </tr>
            </table>
		</td>
		<td width="20%" align="center">
            Total: #matchInfoArray[i].total#<br />
            #matchInfoArray[i].matchDate#
		</td>
		<td width="40%">
        	<table border="0" width="100%">
            	<tr> 	
                	<td align="left">
                        <font size="6">
                        	&nbsp;
                            #matchInfoArray[i].teamTwoScore#
                        </font>
                    </td>
                    <td align="center" width="60%">
                        <font size="4">
                            #matchInfoArray[i].teamTwo#
                        </font>
                    </td>
                </tr>
            </table>
		</td>
	</tr>
</cfoutput>
</cfloop>
</table>




