	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--  

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		global
	@file			series/lib/views/_nav-series.jsp
	@type			partial
	@author			ncavanagh
	@modified		08.15.12	   
	@desc			# generic series navigation
	@note			# broken out into includes for dropdowns for easier modular customization
	@note			# tweaked jstl logic to mirror _nav_series.mobile.jsp, as much as possible. There is almost no difference except
	@note			# for the fact that for each nav item, the id and class name are on <li> in desktop, and on <a href=""> in mobile site!
	@note			# also, li#extras in desktop, li#apps-and-extras in mobile..
	@note			# change was made to enforce every full site to have Community nav for now
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="nav_about_exists" 	  		value="${!empty data.navigation.aboutDropdownNavList || !empty data.navigation.characterNavList}" />
	<c:set var="nav_video_exists" 	  		value="${!empty data.navigation.videoNav.videoNavItemList}" />
	<c:set var="nav_episode_guide_exists"  	value="${!empty data.navigation.episodeGuideNav}" />
	<c:set var="nav_socialize_exists" 		value="${!empty data.socialLinkMap && data.navigation.configuration.hasSocializeNav}" />
	<c:set var="nav_apps_and_extras_exists" value="${!empty data.navigation.appDropdownNavList}" />
	<c:set var="nav_shop_exists" 			value="${!empty data.navigation.shopDropdownNavList}" />
	<c:set var="nav_red_rewards_exists" 	value="${true}" /><%-- `always drawing this item, but using the flag to determine urls in dropdown` --%>
		
	<div id="nav-secondary" class="nav docked nav-secondary">
		<span class="series-title"><a href="${series.baseUrl}/home">
		<c:choose>
			<c:when test="${series.id == 728}">
				The Big C: here<span class="italics">after</span>
			</c:when>
			<c:otherwise>
				<c:out value="${series.displayTitle}"/>
			</c:otherwise>
		</c:choose>
		</a></span>

		<ul class="inline">
		<c:if test="${nav_about_exists}">
			<li id="about" class="nav-item"><a href="#">About</a></li></c:if>
		
		<c:if test="${nav_video_exists}">
			<li id="video" class="nav-item"><a href="#">Video</a></li></c:if>
			
		<c:if test="${nav_episode_guide_exists}">
			<li id="episode-guide" class="nav-item"><a href="#">Episode Guide</a></li></c:if>
			
		<c:if test="${nav_socialize_exists}">
			<li id="socialize" class="nav-item"><a href="#">Community</a></li></c:if>
			
		<%--<c:if test="${nav_apps_and_extras_exists}">
			<li id="extras" class="nav-item"><a href="#">Apps &amp; Extras</a></li></c:if>--%>
		
		<c:if test="${nav_shop_exists}">
			<li id="shop" class="nav-item"><a href="#">Shop</a></li></c:if>
			
		<!-- has-red-rewards=`${nav_red_rewards_exists}` -->
		<c:if test="${nav_red_rewards_exists}">
			<li id="red-rewards" class="nav-item"><a href="#">Red Rewards</a></li></c:if>
		</ul>
		
		<!-- dropdown includes -->
		<c:if test="${nav_about_exists}"><jsp:include				page="./drop_downs/_about.jsp" /></c:if>
		<c:if test="${nav_video_exists}"><jsp:include 				page="./drop_downs/_video.jsp" /></c:if>
		<c:if test="${nav_episode_guide_exists}"><jsp:include 		page="./drop_downs/_episode_guide.jsp" /></c:if>
		<c:if test="${nav_socialize_exists}"><jsp:include 			page="./drop_downs/_socialize.jsp" /></c:if>
		<%--<c:if test="${nav_apps_and_extras_exists}"><jsp:include 	page="./drop_downs/_apps_and_extras.jsp" /></c:if>--%>
		<c:if test="${nav_shop_exists}"><jsp:include 				page="./drop_downs/_shop.jsp" /></c:if>
		<c:if test="${nav_red_rewards_exists}"><jsp:include 		page="./drop_downs/_red_rewards.jsp" /></c:if>
		
	</div><!-- END nav-secondary -->
	