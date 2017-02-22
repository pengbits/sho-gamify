	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_fan_clubs_gallery.jsp
	@type			component/tile
	@author			dpaul
	@modified		04.24.13
	@desc			# draws the markup needed to trigger the fan clubs gallery component
	@note			# map of folders is defined w/ markup, not JSON		
	-----------------------------------------------------------------------------
	--%>
	<div class="nitro-widget fan-clubs-gallery"
		data-component="sho.gamify.fanclubs.Gallery"
		data-defer="nitro:init"
	>
		<div class="fan-club-item small" id="fan-club-sho" data-tags="" data-folder="www_sho">
			<a href="/sho/red-rewards/challenges/showtime"
				style="background-image:url(/assets/images/gamify/fan_club/fan-club-sho_220x220.jpg)">
				<span class="fan-club-name">showtime</span>
				<%-- #<span class="fan-club-points-earned">Points Earned: <em>0</em></span> --%>
				<span class="fan-club-challenges-completed">Challenges Completed: <em>0</em></span>
			</a>
		</div>
		<div class="fan-club-item small" id="fan-club-dexter" data-tags="seriesId:323" data-folder="www_series_323">
			<a href="/sho/dexter/red-rewards/challenges"
				style="background-image:url(/assets/images/gamify/fan_club/fan-club-dexter_220x220.jpg)">
				<span class="fan-club-name">Dexter</span>
				<%-- #<span class="fan-club-points-earned">Points Earned: <em>0</em></span> --%>
				<span class="fan-club-challenges-completed">Challenges Completed: <em>0</em></span>
			</a>
		</div>

		
		<div class="fan-club-item small" id="fan-club-homeland" data-tags="seriesId:804" data-folder="www_series_804">
			<a href="/sho/homeland/red-rewards/challenges"
				style="background-image:url(/assets/images/gamify/fan_club/fan-club-homeland_220x220.jpg)">
				<span class="fan-club-name">Homeland</span>
				<%-- #<span class="fan-club-points-earned">Points Earned: <em>0</em></span> --%>
				<span class="fan-club-challenges-completed">Challenges Completed: <em>0</em></span>
			</a>
		</div>
	
		<div class="fan-club-item small" id="fan-club-penny" data-tags="seriesId:1003223" data-folder="www_series_1003223">
			<a href="/sho/penny-dreadful/red-rewards/challenges"
				style="background-image:url(/assets/images/gamify/fan_club/fan-club-penny_220x220.jpg)">
				<span class="fan-club-name">Penny Dreadful</span>
				<%-- #<span class="fan-club-points-earned">Points Earned: <em>0</em></span> --%>
				<span class="fan-club-challenges-completed">Challenges Completed: <em>0</em></span>
			</a>
		</div>
	</div>