	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com
	@project		series
	@file			series/lib/views/_filters.jsp
	@type			partial
	@author			ncavanagh
	@modified		10.10.12	
	@desc			# Loaded before meta jsp is drawn, this our chance to override xml properties with dynamic data.
	@desc			# used here to populate the title and analytics before base meta is drawn
	@desc			# added nitro support
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="filters.base" />

	<c:if test='${data.pageType != "audio_player"  && data.pageType != "poll"}'>
		<c:set var="nitro_series_id" value="${data.series.id}" scope="request" />
		<c:set var="nitro_category" value="series" scope="request" />
		<c:set var="seriesName" value="${fn:replace(data.series.displayTitle, ':', '')}" />
		<c:set var="seriesName" value="${fn:replace(seriesName, '\\'', '')}" />
		<c:set var="seriesName" value="${fn:replace(seriesName, '&', 'and')}" />
		<c:set var="seriesName" value="${fn:replace(seriesName, '!', '')}" />
		<c:set var="seriesNameLowercase" value="${fn:toLowerCase(seriesName)}" scope="request" />
		<c:set var="bodyCssClass" value="${bodyCssClass} ${data.pageType}" scope="request" />
		<c:set var="og_default_title" value="${data.series.displayTitle} on Showtime" scope="request" />
		<c:if test='${empty og_image}'>
			<c:set var="og_image" value="http://www.sho.com/site/image-bin/images/${data.series.id}_0_0/${data.series.id}_0_0_97_246x246.jpg" scope="request" />
		</c:if>	
	</c:if>
	
	<c:choose>
	
		<c:when test='${data.pageType == "home"}'>
			<c:set var="pageTracking" value="series:${seriesNameLowercase}:${data.pageType}" scope="request" />
			<c:set var="og_title" value="${not empty og_title ? og_title : og_default_title}" scope="request" />
			<c:set var="og_description" value="${data.series.shortDescription}" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "about"}'>
			<c:set var="pageTracking" value="series:${seriesNameLowercase}:${data.pageType}:home" scope="request" />
			<c:set var="og_title" value="${not empty og_title ? og_title : og_default_title}" scope="request" />
			<c:set var="og_description" value="${data.series.shortDescription}" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "cast"}'>
			<c:set var="characterNameLowercase" value="${fn:toLowerCase(data.castInfo.character.name)}"/>
			<c:set var="bodyCssClass" value="${bodyCssClass} cast" scope="request" />
			<c:choose>
				<c:when test='${data.castInfo.isPlayingThemselves}'>
					<c:set var="title" value="${data.castInfo.talent.name} on ${data.series.displayTitle}" scope="request" />
					<c:set var="og_description" value="Everything you need to know about ${data.castInfo.character.name} from ${data.series.displayTitle}." scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="title" value="${data.castInfo.talent.name} as ${data.castInfo.character.name} in ${data.series.displayTitle}" scope="request" />
					<c:set var="og_description" value="Everything you need to know about ${data.castInfo.character.name}, played by ${data.castInfo.talent.name}, from ${data.series.displayTitle}. ${data.tuneIn}." scope="request" />
				</c:otherwise>
			</c:choose>
			<c:set var="description" value="" scope="request" />
			<c:set var="og_title" value="${data.castInfo.character.name} from ${data.series.displayTitle} on Showtime" scope="request" />
			<c:set var="og_image_path" value="${fn:replace(data.castInfo.image.path, '1024x512', '246x246')}" />
			<c:set var="og_image_path" value="${fn:replace(og_image_path, '640x320', '246x246')}" />
			<c:set var="og_image" value="http://www.sho.com${og_image_path}" scope="request" />
			<c:set var="pageTracking" value="series:${seriesNameLowercase}:about:${characterNameLowercase}" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "video"}'>
			<c:set var="videoTrackingStr"><c:out value="series:${seriesNameLowercase}:video:season:${data.seasonVideo.seasonNumber}" /></c:set>
			<c:set var="videoTitleStr"><c:out value="Season ${data.seasonVideo.seasonNumber} Videos of the series ${data.series.displayTitle}" /></c:set>
			<c:set var="bodyCssClass" value="${bodyCssClass} series-video video-portal video-portal-series" scope="request" />
			<c:set var="title" value="${videoTitleStr}" scope="request" />
			<c:set var="description" value="" scope="request" />
			<c:set var="pageTracking" value="${videoTrackingStr}" scope="request" />
			<c:set var="nitro_season_number" value="${data.seasonVideo.seasonNumber}" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "season"}'>
			<c:set var="seasonTrackingStr"><c:out value="series:${seriesNameLowercase}:episode guide:season:${data.seasonView.number}:home" /></c:set>
			<c:set var="bodyCssClass" value="${bodyCssClass} episode-guide" scope="request" />
			<c:set var="defaultSeasonTitle" value="Season ${data.seasonView.number}"/>
			<c:set var="seasonTitle" value="${(data.seasonView.name != null) ? data.seasonView.name : defaultSeasonTitle}"/>
			<c:set var="title" value="${data.series.displayTitle} - Episode Guide - ${seasonTitle} - Showtime" scope="request" />
			<c:set var="description" value="${data.seasonView.shortDescription}" scope="request" />
			<c:set var="pageTracking" value="${seasonTrackingStr}" scope="request" />
			<c:set var="nitro_season_number" value="${data.seasonView.number}" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "episode"}'>
			<c:set var="episodeDetailTrackingStr"><c:out value="series:${seriesNameLowercase}:episode guide:season:${data.currentEpisode.episode.seasonNumber}:episode:${data.currentEpisode.episode.episodeNumber}:home" /></c:set>
			<c:set var="bodyCssClass" value="${bodyCssClass} episode-guide" scope="request" />
			<c:set var="defaultSeasonTitle" value="Season ${data.currentEpisode.episode.seasonNumber}"/>
			<c:set var="seasonTitle" value="${(data.currentEpisode.episode.seasonName != null) ? data.currentEpisode.episode.seasonName : defaultSeasonTitle}"/>
			<c:set var="title" value="${data.series.displayTitle} - ${seasonTitle} - Episode ${data.currentEpisode.episode.episodeNumber} - ${data.currentEpisode.episode.title} - Showtime" scope="request" />
			<c:set var="description" value="${data.currentEpisode.episode.shortDescription}" scope="request" />
			<c:set var="og_title" value="Episode ${data.currentEpisode.episode.episodeNumber} from Season ${data.currentEpisode.episode.seasonNumber} of ${data.series.displayTitle} on Showtime" scope="request" />
			<c:set var="og_description" value="${data.currentEpisode.episode.shortDescription}" scope="request" />
			<c:set var="og_image_path" value="${fn:replace(data.currentEpisode.episode.image.path, '444x250', '246x246')}" />
			<c:set var="og_image_path" value="${fn:replace(og_image_path, '640x360', '246x246')}" />
			<c:set var="og_image" value="http://www.sho.com${og_image_path}" scope="request" />
			<c:set var="pageTracking" value="${episodeDetailTrackingStr}" scope="request" />
			<c:set var="nitro_season_number" value="${data.currentEpisode.episode.seasonNumber}" scope="request" />
			<c:set var="nitro_title_id" value="${data.currentEpisode.episode.id}" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "socialize"}'>
			<c:set var="pageTracking" value="series:${seriesNameLowercase}:${data.pageType}" scope="request" />
			<c:set var="title" value="${data.series.displayTitle} Fan Community - Showtime" scope="request" />
			<c:set var="og_title" value="Talk with other fans about ${data.series.displayTitle} on Showtime" scope="request" />
			<c:set var="og_description" value="See what other fans are saying about ${data.series.displayTitle}. Join the discussion now!" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "extras"}'>
			<c:set var="pageTracking" value="series:${seriesNameLowercase}:${data.pageType}:home" scope="request" />
			<c:set var="title" value="${data.series.displayTitle} Apps and Extras - Showtime" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "audio_player"}'>
			<c:set var="displayTitle" value="${fn:substringBefore(data.show.displayTitle,':')}"/>
			<c:set var="seriesNameLowercase" value="${fn:toLowerCase(displayTitle)}"/>
			<c:set var="songTitleLowercase" value="${fn:toLowerCase(data.audio.title)}"/>
			<c:set var="pageTracking" value="series:${seriesNameLowercase}:audio:season ${data.show.seasonNumber}:episode ${data.show.episodeNumber}:${songTitleLowercase}" scope="request" />
		</c:when>
		
		<c:when test='${data.pageType == "poll"}'>
			<c:set var="pageTracking" value="series:${fn:toLowerCase(data.series.title)}:episode guide:season ${data.episodeItemView.seasonNumber}:episode ${data.episodeItemView.episodeNumber}:polls" scope="request" />
			<c:set var="title" value="Showtime - ${data.series.displayTitle} - Polls" scope="request" />
			<c:set var="og_title" value="${title}" scope="request" />
			<c:set var="description" value="${data.series.shortDescription}" scope="request" />
			<c:set var="og_description" value="${description}" scope="request" />
			<c:set var="og_image" value="${data.episodeItemView.image.fullPath}" scope="request" />
		</c:when>
		
		
		
	</c:choose>
