	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		generic series
	@file			dexter/s6/views/body-bag-toss/index.jsp
	@type			page
	@author			ncavanagh	
	@desc			body bag toss for dexter
	@note 			
	--------------------------------------------------------------------------------
	--%>
	<style type="text/css" media="screen">
		#bbt-wrapper {
			width: 800px;
			height: 500px;
			margin: 0 auto;
		}
	</style>
	<tiles:insertDefinition name="series.tune-in" />
	<tiles:insertDefinition name="series.games-dropdown" />
	<div class="game-wrapper">
		<div id="bbt-wrapper">
			<div id="flashGame">
				<a onclick="OmniHelp.tc('getflash');" href="http://www.adobe.com/go/getflashplayer">You will need a current version of Flash to view this content. Click here to download the latest Flash Player.</a>
			</div><!--/bodyBagTossGame-->
		</div>
	</div>

    
<script type="text/javascript" defer="defer">
	sho.dom.ready(function() 
	{
		var flashvars = {
			src:'/assets/flash/series/dexter/s6/bodybagtoss/BodyBagGame',
			gameId: "161",
			logInModal:'javascript:sho.accounts.nitro.optIn();',
			gameStartCallback:(function(){
				sho.dom.trigger('game:started');
			}),
			gameEndCallback:(function(){
				sho.dom.trigger('game:ended');
			})
		};
		var params = {
			wmode: "transparent",
			base: "/assets/flash/series/dexter/s6/bodybagtoss/"
		};
		var attributes = {};
		swfobject.embedSWF("/assets/flash/series/dexter/s6/bodybagtoss/BodyBagPreloader.swf", "flashGame", "800", "500", "10.0.0", "/lib/bin/expressInstall.swf", flashvars, params, attributes);
	});
</script>