	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			_about_season.mobile.jsp
	@type			partial
	@author			dpaul
	@modified		Wed Aug 22 14:39:47 EDT 2012
	@note			# draws about the series text, handles both new and returning shows.
	--------------------------------------------------------------------------------
	--%>
	<c:if var="is_new_season" test="${(data.aboutSeasonNumber == '1' and data.episodeNextOn.seasonNumber == '1') || (data.aboutSeasonNumber == '1' and data.episodeNextOn == null)}" />
	<c:set var="about_season_header" value="${is_new_season ? 'Where Does The Series Start?' : 'What Happened Last Season?' }" />

	<tiles:insertDefinition name="modules.section_header.gradient">
		<tiles:putAttribute name="title" value="${about_season_header}" />
	</tiles:insertDefinition>
	
	<p>${data.aboutSeasonDesc}</p>
	<c:choose>
		<c:when test="${data.aboutSeasonNumber == '1'  and (data.episodeLastOn != null || data.episodeNextOn != null)}">
			<p>To get up to date on storylines, <a href="${data.series.baseUrl}/season/${data.aboutSeasonNumber}">check out episode summaries and show scenes.</a></p>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${data.aboutSeasonNumber > '1'}">
					<p>To get up to date on storylines, <a href="${data.series.baseUrl}/season/${data.aboutSeasonNumber}">check out episode summaries and show scenes.</a></p>
				</c:when>
				<c:otherwise> 
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
