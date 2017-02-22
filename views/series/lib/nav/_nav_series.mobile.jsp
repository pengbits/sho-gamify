	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			lib/views/modules/_nav_series.mobile.jsp
	@type			partial
	@modified		10.02.12
	@author			dpaul	
	# An example primary navigation module for mobile site. (series context) In production,
	# there will likely be several different instances of this component.
	# we may want to try omitting one of drop-downs to test support for items that don't have associated child menus.
	# adding links in the top-level navigation, for seo purposes.
	--------------------------------------------------------------------------------
	--%>
	<c:set var="nav_about_exists"  			value="${!empty data.navigation.aboutDropdownNavList || !empty data.navigation.characterNavList}" />
	<c:set var="nav_video_exists" 	  		value="${!empty data.navigation.videoNav.videoNavItemList}" />
	<c:set var="nav_episode_guide_exists"  	value="${!empty data.navigation.episodeGuideNav}" />
	<c:set var="nav_socialize_exists" 		value="${!empty data.socialLinkMap && data.navigation.configuration.hasSocializeNav}" />
	<c:set var="nav_apps_and_extras_exists" value="${!empty data.navigation.appDropdownNavList}" />
	<c:set var="nav_shop_exists" 			value="${!empty data.navigation.shopDropdownNavList}" />
	<c:set var="nav_base_season_number"		value="${!empty data.promotedLatestSeason ? data.promotedLatestSeason.number : 1}" />
	<c:set var="nav_base_url" 				value="${data.series.baseUrl}"/>
	
	<div data-component="sho.ui.mobile.nav.Primary" id="nav-primary" class="nav-primary nav-primary-outer">
		<div class="nav-primary-inner">
			<div class="nav-primary-top">
				<ul class="inline">
				<c:if test="${nav_about_exists}">
					<li><a href="${nav_base_url}/about" id="about" class="nav-item">About</a></li></c:if>
				
				<c:if test="${nav_video_exists}">
					<li><a href="${nav_base_url}/video/season/${nav_base_season_number}" id="video" class="nav-item">Video</a></li></c:if>
					
				<c:if test="${nav_episode_guide_exists}">
					<li><a href="${nav_base_url}/season/${nav_base_season_number}/episode/1" id="episode-guide" class="nav-item">Episode Guide</a></li></c:if>
					
				<c:if test="${nav_socialize_exists}">
					<li><a href="${nav_base_url}/socialize" id="socialize" class="nav-item">Community</a></li></c:if>
					
				<%--<c:if test="${nav_apps_and_extras_exists}">
					<li><a href="${nav_base_url}/extras" id="apps-and-extras" class="nav-item">Apps &amp; Extras</a></li></c:if>--%>
				
				<c:if test="${nav_shop_exists}">
					<li><a href="http://store.sho.com" id="shop" class="nav-item">Shop</a></li></c:if>
					
				</ul>
			</div><!-- ./nav-primary-top -->
		</div><!-- ./nav-primary-inner -->
	
		<c:if test="${nav_about_exists}"><jsp:include				page="./drop_downs/_about.mobile.jsp" /></c:if>
		<c:if test="${nav_video_exists}"><jsp:include 				page="./drop_downs/_video.mobile.jsp" /></c:if>
		<c:if test="${nav_episode_guide_exists}"><jsp:include 		page="./drop_downs/_episode_guide.mobile.jsp" /></c:if>
		<c:if test="${nav_socialize_exists}"><jsp:include 			page="./drop_downs/_socialize.mobile.jsp" /></c:if>
		<%--<c:if test="${nav_apps_and_extras_exists}"><jsp:include 	page="./drop_downs/_apps_and_extras.mobile.jsp" /></c:if>--%>
		<c:if test="${nav_shop_exists}"><jsp:include 				page="./drop_downs/_shop.mobile.jsp" /></c:if>

	</div><!-- ./nav-primary-outer -->
	