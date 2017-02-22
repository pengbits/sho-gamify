	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/_meta.jsp
	@type			partial
	@author			ncavanagh	
	@desc			custom metadata for series pages
	--------------------------------------------------------------------------------
	--%>
	<tiles:importAttribute />
	<tiles:insertDefinition name="meta.base" />
	<c:if test='${data.pageType != "audio_player"}'>
		<meta itemprop="image" content="http://www.sho.com/site/image-bin/images/${data.series.id}_0_0/${data.series.id}_0_0_97_246x246.jpg" />
		<meta name="twitter:card" content="summary_large_image">		
	</c:if>

	<c:if test='${data.pageType == "meta"}'>
        <title>${data.series.displayTitle}</title>		
        <meta name="series-name" content="${data.series.displayTitle}">
        <meta name="series-link" content="${data.series.baseUrl}/home">
        <meta name="tune-in" content="${data.tuneIn}">
        <c:if test='${!empty data.series.mediumDescription}'>
            <meta name="medium-description" content="${data.series.mediumDescription}">
        </c:if>
    	<c:if test='${data.waysToWatchFields.linearUrl != null}'>
            <meta name="on-tv-all" content="${data.waysToWatchFields.linearUrl}">
        </c:if>
    	<c:if test='${data.waysToWatchFields.onDemandUrl != null && data.waysToWatchFields.isOnDemand == true}'>
            <meta name="on-demand" content="${data.waysToWatchFields.onDemandUrl}">
        </c:if>
    	<c:if test='${data.waysToWatchFields.showtimeAnytimeLink != null && data.waysToWatchFields.isOnAnytime == true}'>
            <meta name="showtime-anytime" content="${data.waysToWatchFields.showtimeAnytimeLink}">
        </c:if>
        <meta name="key-art" content="http://www.sho.com/site/image-bin/images/${data.series.id}_0_0/${data.series.id}_0_0_97_564x423.jpg">

        <c:if test='${!empty data.navigation.aboutDropdownNavList}'>
            <meta name="series-navigation" content="About|${data.series.baseUrl}/about">
        </c:if>
        <c:if test='${!empty data.navigation.videoNav.videoNavItemList}'>
            <meta name="series-navigation" content="Video|${data.series.baseUrl}/video">
        </c:if>
        <c:if test='${!empty data.navigation.seasonNavList}'>
            <c:forEach items="${data.navigation.seasonNavList}" var="season" varStatus="status">
                <c:if test="${status.last}">    
                    <meta name="series-navigation" content="Episode Guide|${data.series.baseUrl}/season/${season.seasonNumber}">
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test='${!empty data.navigation.shopDropdownNavList}'>
            <meta name="series-navigation" content="Shop|http://store.sho.com">
        </c:if>
        <c:if test='${!!data.navigation.configuration.hasRedRewardsNav}'>
            <meta name="series-navigation" content="Red Rewards|${data.series.baseUrl}/red-rewards/challenges">
        </c:if>

        <c:if test='${!empty data.navigation.characterNavList}'>
			<c:forEach items="${data.navigation.characterNavList}" var="character">
                <meta name="character" content="${character.name}|${character.talentName}|${character.url}|${character.image.path}">
			</c:forEach>
        </c:if>
        <c:if test='${data.nextAiringString != null}'>
            <meta name="next-airing" content="${data.nextAiringString}">
        </c:if>
        <c:if test='${data.fulVideoView != null}'>
            <meta name="full-episode" content="${data.fulVideoView.url}|${data.fulVideoView.image.path}">
        </c:if>
        <c:if test='${!empty data.recentSeriesVideoViews}'>
			<c:forEach items="${data.recentSeriesVideoViews}" var="video">
                <meta name="video" content="${video.url}|${video.title}|${video.image.path}">
			</c:forEach>
        </c:if>
	</c:if>
	

