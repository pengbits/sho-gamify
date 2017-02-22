	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/episode_guide/seasons/show.jsp
	@type			page
	@author			dpaul	
	@desc			series season landing page
	@note 			'formerly `series/lib/views/episode_guide/index_season.jsp`'
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="seriesSeasonEpNav" value="${data.seriesSeasonEpNav}"/>
	<c:set var="seasonView" value="${data.seasonView}"/>
	<c:set var="waysToWatchFields" value="${data.waysToWatchFields}"/>
		
	<img class="full-width" src="http://www.sho.com/${seasonView.image.path}" alt="" />

	<c:set var="currentSeasonDefaultText" value="Season ${seasonView.number}"/>
	
	<tiles:insertDefinition name="modules.social.seeit_reminder">
		<tiles:putAttribute name="wrappername" value="seeit-reminder--wrapper--season" />
	</tiles:insertDefinition>
	
	<c:set var="currentSeasonText" value="${(seasonView.name != null) ? seasonView.name : currentSeasonDefaultText}"/>
	<tiles:insertDefinition 
		name="modules.section_header.black">
		<tiles:putAttribute name="title" value="${currentSeasonText}" /></tiles:insertDefinition>
	
	<c:if test="${!empty seasonView.longDescription}">
		<p>${seasonView.longDescription}</p></c:if>
	<tiles:insertDefinition 
		name="series.related_videos.mobile">
		<tiles:putAttribute name="videos" value="${data.seasonView.videoList}" /></tiles:insertDefinition>
	
	<c:if test="${!empty seasonView.episodeList}">
		<tiles:insertDefinition 
			name="modules.section_header.gradient">
			<tiles:putAttribute name="title" value="Episodes" /></tiles:insertDefinition>
	
		<c:set var="itemLabel" value="contextualTitle"/>
	
		<tiles:insertDefinition 
			name="modules.disclosure_list">
			<tiles:putAttribute name="theme" value="text-link" />
			<tiles:putAttribute name="items" value="${seasonView.episodeList}" />
			<tiles:putAttribute name="item_url" value="url" />
			<tiles:putAttribute name="item_label" value="${itemLabel}" />
			<tiles:putAttribute name="item_parent" value="episode" /></tiles:insertDefinition>
	</c:if>