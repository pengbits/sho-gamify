<style type="text/css" media="screen">
	#flash-wrapper{position:fixed;top:100px;bottom:65px;width:100%;}
	#flash-container{width:100%;height:100%;}
	.tracking-pixel,.trackingpixel{height:0px;width:0px;overflow:hidden;}
	.series-footer{display:none;position:absolute;}
	#foot{position:fixed;bottom:67px;left:5px;}
</style>
<script type="text/javascript">
	
	sho.dom.bind('nitro:init', function(){
		sho.accounts.nitro.getInstance().logAction({
			'tags':'special-feature_view'
		});
	});	
	
	var flashvars = {
		src:'/assets/flash/series/dexter/s6/killroom/DextersKillRoomRoot',
		feedUrl:"/assets/xml/series/dexter/s6/killroom/feed.xml"
	};
	var params = {
		allowScriptAccess:"always",
		allowFullScreen:true,
		wmode:"transparent"
	};
	var attributes = {
	};
	attributes.id = "flashContent";
	swfobject.embedSWF("/assets/flash/series/dexter/s6/killroom/KillRoomPreloader.swf", "alternateContent", "100%", "100%", "9.0.115`", "/lib/bin/expressInstall.swf", flashvars, params, attributes);
</script>
<div id="flash-wrapper">
	<div id="flash-container">
		<div id="alternateContent">
			<a href="http://www.adobe.com/go/getflashplayer">
				<a href="http://www.adobe.com/go/getflashplayer">You will need a current version of Flash to view this content. Click here to download the latest Flash Player.</a>
			</a>
		</div>
	</div>
	<div id="foot">
		<div class="fb-share-button" data-href="http://www.sho.com/sho/dexter/extras/dexters-kill-room" data-send="false" data-type="button_count" data-show-faces="false" data-font="arial"></div>
	</div>
</div>
