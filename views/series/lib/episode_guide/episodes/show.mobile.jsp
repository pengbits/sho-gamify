	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/episode_guide/episodes/show.jsp
	@type			page
	@author			dpaul
	@modified		09.11.14	
	@desc			# episode details page for mobile site
	@note			# in this context, current means active, ie the page the user requested, not the actual status of the series!
	@note			# added schema_writer to draw google watch actions
	--------------------------------------------------------------------------------
	--%>
	<c:set var="socializePromoFields" value="${data.socializePromoFields}"/>
	<c:set var="seriesSeasonEpNav" value="${data.seriesSeasonEpNav}"/>
	<c:set var="series" value="${data.series}"/>
	<c:set var="currentEpisode" value="${data.currentEpisode}"/>
	<c:set var="currentEpisodeNumber" value="${data.currentEpisode.episode.episodeNumber}"/>
	<c:set var="currentSeasonNumber" value="${data.currentEpisode.episode.seasonNumber}"/>
	<c:set var="episodeHasMusicDownloads" value="false"/>
	<c:set var="episodeRecaps" value="${data.episodeModule}"/>

	<c:forEach items="${seriesSeasonEpNav.seasonNavList}" var="s">
		<c:if test="${s.currentSeason == true}">
			<c:set var="seasonEpisodeList" value="${s.episodeNavList}" />
		</c:if>
	</c:forEach>

	<tiles:insertDefinition name="modules.section_header.black">
		<tiles:putAttribute name="title" value="Season ${data.currentEpisode.episode.seasonNumber}" />
	</tiles:insertDefinition>
	
	<c:if test="${!empty data.currentEpisode && !empty data.currentEpisode.episode}">
	<tiles:insertDefinition name="modules.episode_guide.schema_writer">
		<tiles:putAttribute name="episode" 		value="${currentEpisode.episode}" />
		<tiles:putAttribute name="series"		value="${series}" />
		<tiles:putAttribute name="schedule"		value="${currentEpisode.episode.scheduleView}" />
	</tiles:insertDefinition>
	</c:if>
	
	<div data-component="sho.ui.mobile.SuperSelect" class="super-select">
		<div class="super-select-label">
			<b>Episode ${currentEpisodeNumber}</b>
		</div>
		<div class="super-select-menu">
			<select>
				<c:forEach items="${seasonEpisodeList}" var="episode">
					<c:choose>
						<c:when test="${episode.episodeNumber == currentEpisodeNumber}">
							<option selected="selected" value="${series.baseUrl}/season/${currentSeasonNumber}/episode/${episode.episodeNumber}">Episode ${episode.episodeNumber}</option>
						</c:when>
						<c:otherwise>
							<option value="${series.baseUrl}/season/${currentSeasonNumber}/episode/${episode.episodeNumber}">Episode ${episode.episodeNumber}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
	</div><!-- END super-select -->
	
	<tiles:insertDefinition 
		name="modules.slideshow">
		<tiles:putAttribute name="primary_image" value="${currentEpisode.episode.image}" />
		<tiles:putAttribute name="image_list" 	 value="${currentEpisode.episode.imageList}" /></tiles:insertDefinition>
	
	<span class="block">
		<h3>${currentEpisode.episode.displayTitle}</h3>
		<p>${currentEpisode.episode.isUpcoming ? currentEpisode.episode.shortDescription : currentEpisode.episode.longDescription}</p>
		<c:if test="${currentEpisode.episode.id == 3364059}">
			<p>
				Union Bank&reg; is not affiliated or related in any way to the Union Banking Corporation referred to in this episode.
			</p>
		</c:if>
	</span>

	<tiles:insertDefinition 
		name="modules.video_gallery.mobile">
		<tiles:putAttribute name="videos" value="${currentEpisode.episode.videoList}" /></tiles:insertDefinition>

	<tiles:insertDefinition
		name="modules.social_components_urls" />
	<tiles:insertDefinition
		name="modules.social_components.content" >
		<tiles:putAttribute name="url" value="${currentEpisode.episode.url}" /></tiles:insertDefinition>

	<tiles:insertDefinition 
		name="modules.ways_to_watch">
		<tiles:putAttribute name="show" 	value="${currentEpisode.episode}" />
		<tiles:putAttribute name="context" 	value="series" />
		<tiles:putAttribute name="ondemand_slug"><c:if test="${!empty data.series && !empty data.series.id && !empty data.series.shortTitle}">${data.series.id}/${fn:toLowerCase(fn:replace(data.series.shortTitle, ' ', '-'))}</c:if>
		</tiles:putAttribute></tiles:insertDefinition>	

	<tiles:insertDefinition 
		name="modules.credit_list">
		<tiles:putAttribute name="show" value="${currentEpisode.episode}" />
		<tiles:putAttribute name="type" value="series" /></tiles:insertDefinition>
	
	<%-- external content (episode recaps) --%>							
	<c:if test="${!empty episodeRecaps}">
		<tiles:insertDefinition name="modules.external_content">
			<tiles:putAttribute name="data_array" value="${episodeRecaps}" />
			<tiles:putAttribute name="platform" value="mobile" /></tiles:insertDefinition>
	</c:if>	
			
	<tiles:insertDefinition 
		name="modules.advisories_and_metadata">
		<tiles:putAttribute name="show" value="${currentEpisode.episode}" /></tiles:insertDefinition>
		
	<tiles:insertDefinition 
		name="modules.song_list" />
	
	<c:if test="${!empty customValueMap['storeView']}">
		<tiles:insertDefinition 
			name="series.in-the-store.gradient">
			<tiles:putAttribute name="view" value="${customValueMap['storeView']}" />
			<tiles:putAttribute name="context" value="episode" />
		</tiles:insertDefinition>
	</c:if>
