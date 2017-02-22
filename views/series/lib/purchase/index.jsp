	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		purchase episodes page
	@file			series/views/purchase/index.jsp
	@type			page
	@author			dpaul
	@modified		05/15/14
	@desc			# an example use of the purchase page faux carousel. 
	@desc			# in practice, this is set up in the series-specific folder, ie /series/raydonovan/views/purchase
	@note			# introducing a new kind of psuedo-markup for setting the lists of purchase urls:
	@note			# pass in via [label])(url),[label])(url),[label])(url),[label])(url)
	--------------------------------------------------------------------------------
	--%>
	
	<tiles:insertDefinition name="series.purchase.faux_carousel">
		<tiles:putAttribute name="image"		value="/assets/images/series/raydonovan/promos/purchase_1024x640.jpg" />
		<tiles:putAttribute name="headline" 	value="Own the First Season Of<br /> Ray Donovan" />
		<tiles:putAttribute name="sub_title"	value="Relive all 5 seasons of the iconic series." />
		<tiles:putAttribute name="videos">
		[View Preview](/sho/video/titles/20939/next-on-episode-1)
		</tiles:putAttribute>
		<tiles:putAttribute name="purchase_urls">
		[iTunes](https://itunes.apple.com/us/tv-season/ray-donovan-season-1/id845224965?uo=4&at=10lwtv),
		[Amazon Instant Video](http://www.amazon.com/gp/product/B00K6NFDX0),
		[Google Play](https://play.google.com/store/tv/show/Ray_Donovan?id=0AE_5m3lwos),
		[Vudu](http://www.vudu.com/movies/#!content/532292),
		[Sony Entertainment Network](https://store.sonyentertainmentnetwork.com/#!/cid=UV0025-NPVA88472_CN-0000000000226646?EMCID=VU000156),
		[Target Ticket](https://www.targetticket.com/tv/ray-donovan/597689/0),
		[Verizon FiOS](https://www.verizon.com/OnDemand/unprotected/TVShowsDtl.aspx?seriesId=Ray%20Donovan&seasonId=1&episodeId=01&PName)
		</tiles:putAttribute>
	</tiles:insertDefinition>