<div id="playerWrapper" style="position:absolute; top:0; left:0">
	<!-- Start of Brightcove Player -->
	<div style="display:none;"></div>
	<!-- By use of this code snippet, I agree to the Brightcove Publisher T and C
	found at https://accounts.brightcove.com/en/terms-and-conditions/. -->
	<script language="JavaScript" type="text/javascript" src="http://admin.brightcove.com/js/BrightcoveExperiences.js"></script>
	<object id="myExperience" class="BrightcoveExperience">
		<param name="bgcolor" value="#ffffff" />
		<param name="width" value="300" />
		<param name="height" value="80" />
		<param name="playerID" value="941728344001" />
		<param name="playerKey" value="AQ~~,AAAAAAAA9pg~,GnOHJwU2r3uQqlnX0KUVH6Zj5pWCujBn" />
		<param name="isAudio" value="true" />
		<param name="isUI" value="true" />
		<param name="dynamicStreaming" value="true" />
		<param name="@audioList" value="${data.audio.playlistId}" />
		<param name="@audioList.featured" value="${data.audio.titleId}" />
		<!--param name="@audioPlayer" value="941690749001"-->
	</object>
	<!-- End of Brightcove Player -->
</div>

<!-- 
This script tag will cause the Brightcove Players defined above it to be created as soon
as the line is read by the browser. If you wish to have the player instantiated only after
the rest of the HTML is processed and the page load is complete, remove the line.
-->
<script type="text/javascript">brightcove.createExperiences();</script>

<!-- End of Brightcove Player -->

