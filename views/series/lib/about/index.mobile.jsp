	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/about/index.mobile.jsp
	@type			page
	@author			dpaul	
	@desc			about page for series / mobile
	@modified		08.22.12
	--------------------------------------------------------------------------------
	--%>
	
	<tiles:insertDefinition name="modules.tune_in_block">
		<tiles:putAttribute name="tunein_text" value="${data.tuneIn}" />
	</tiles:insertDefinition>

	<tiles:insertDefinition name="modules.carousel.single"/>
	
		
	<tiles:insertDefinition
		name="modules.social_components_urls" />
	<tiles:insertDefinition
		name="modules.social_components.follow" >
		<tiles:putAttribute name="fb_url" value="${facebookURL}" />
		<tiles:putAttribute name="twitter_url" value="${twitterURL}" />
		<tiles:putAttribute name="url" value="${'http://www.sho.com'}" /></tiles:insertDefinition>
	
	<tiles:insertDefinition name="modules.ways_to_watch.series" />
	
	<tiles:insertDefinition name="modules.disclosure_list">
		<tiles:putAttribute name="theme" value="thumb-list" />
		<tiles:putAttribute name="items" value="${data.navigation.characterNavList}" />
		<tiles:putAttribute name="item_url" value="url" />
		<tiles:putAttribute name="item_label" value="name" />
		<tiles:putAttribute name="thumb" value="image" />
		<tiles:putAttribute name="thumb_src" value="path" />
		<tiles:putAttribute name="thumb_fallback" value="/assets/images/series/lib/about/panels/Cast_Generic_Silo_160x80.jpg" />
	</tiles:insertDefinition>
		
	<tiles:insertDefinition name="series.about-season.mobile" />