<!-- ************ -->
<!-- MAIN CONTENT -->
<!-- ************ -->
<div class="main_content_wrapper main_content_wrapper_sidebar">        
    <div class="content_610">
    	<h3>Contact Us</h3>
        <p>Thank you for expressing interest in WeCodeThings' services. Feel free to contact us with any questions by filling out the contact form below. You will receive a response from us within 24 hrs. We look forward to hearing from you!</p>
        <cfoutput>
			<cfif rc.mail eq true>
				<!--Success Message-->
		        <div class="success_message">
		        	<h2>Message sent!</h2>
		        </div>
		        <!--Success Message-->
			<cfelseif len(rc.mail)>
				<div class="error_message">
		        	<h2>
		        		<cfloop list="#rc.mail#" index="errors">
							#errors#	
							<br />
						</cfloop>
					</h2>
		        </div>
			</cfif>
		</cfoutput>
        <!-- CONTACT FORM -->
        <div id="cf_top"></div>
        <div id="cf_main">
        	<cfoutput>
        	<form action="#buildURL( 'main.contact?mail=true' )#" method="post" id="contact_form">
            	<div class="input_wrapper">
            		<div class="cf_label">Name * :</div>
            		<input class="required" type="text" id="name" name="name" value="#rc.name#">
                </div>
                <div class="input_wrapper">
            		<div class="cf_label">Email * :</div>
            		<input type="text" id="cemail" name="email" class="required email" value="#rc.email#">
                </div>
                <div class="clear"></div>
                <div class="input_wrapper">
            		<div class="cf_label">Phone number :</div>
            		<input class="phone" type="text" name="phone" value="#rc.phone#">
                </div>
                <div class="input_wrapper">
            		<div class="cf_label">Your website :</div>
            		<input class="website" type="text" name="website" value="#rc.website#">
                </div>
                <div class="clear"></div>
                <div class="input_wrapper">
            		<textarea name="message" id="message" rows="20" cols="20" class="required">#rc.message#</textarea>
                </div>
                <div class="input_wrapper">
            		<div class="cf_label verification_label" style="float:left; padding:8px 10px 0 0;">Enter a number between 5 and 8 * :</div>
                    <input type="text" class="verification" id="verification" name="verification" value="#rc.verification#">
                </div>
                
                <div class="clear"></div>
            		<div><input type="submit" id="submit" class="button" value="Send message"></div>
            </form>
			</cfoutput>
        </div><!-- End of cf_main -->
        <div id="cf_bottom"></div>
        <!-- CONTACT FORM -->
        
        <div class="content_separator"></div>
        <div class="location_box">
        
        	<h4>Reno location</h4>
            <p>527 Lander St. Suite 102 Reno, NV<br><a href="mailto:support@wecodethings.com">Support@WeCodeThings.com</a><br>Office Phone: (775) 591-8277</p>
            <object type="text/html" width="285" height="170" data="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=527+Lander+St.+Reno+NV&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=42.495706,79.013672&amp;ie=UTF8&amp;hq=&amp;hnear=527+Lander+St,+Reno,+Nevada+89509&amp;z=14&amp;ll=39.519506,-119.815394&amp;output=embed"></object><br><small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=527+Lander+St.+Reno+NV&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=42.495706,79.013672&amp;ie=UTF8&amp;hq=&amp;hnear=527+Lander+St,+Reno,+Nevada+89509&amp;z=14&amp;ll=39.519506,-119.815394">Enlarge map</a></small>
        </div><!-- End of location_box -->
        
        <!---<div class="location_box box_last">
        	<h4>Brussels location</h4>
            <p>105A - Street Address, London (5000)<br>Contact: Anna Jones - <a href="#">anna@domain.com</a><br>Office Phone: (+33) 333-555-000</p>
            <object type="text/html" width="285" height="170" data="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=ro&amp;geocode=&amp;q=centre+d'affaires+Chateau+Rouge,+276+Avenue+de+la+Marne,+59700+Marcq-en-Bar%C5%93ul,+France&amp;aq=0&amp;sll=48.15027,11.62239&amp;sspn=0.006328,0.017885&amp;g=Arabellastra%C3%9Fe+23,+81925,+M%C3%BCnchen,+Deutschland&amp;ie=UTF8&amp;ll=50.679951,3.115025&amp;spn=0.032789,0.051745&amp;output=embed"></object><br><small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=ro&amp;geocode=&amp;q=centre+d'affaires+Chateau+Rouge,+276+Avenue+de+la+Marne,+59700+Marcq-en-Bar%C5%93ul,+France&amp;aq=0&amp;sll=48.15027,11.62239&amp;sspn=0.006328,0.017885&amp;g=Arabellastra%C3%9Fe+23,+81925,+M%C3%BCnchen,+Deutschland&amp;ie=UTF8&amp;ll=50.679951,3.115025&amp;spn=0.032789,0.051745">Enlarge map</a></small>
        </div><!-- End of location_box -->--->
    </div><!-- End of content_610 -->
    
	<cfoutput>
	 #view('main/sidebar')#
	</cfoutput>
    
</div><!-- End of main_contetn_wrapper -->
