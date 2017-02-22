	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		series about season module
	@file			series/lib/views/_about_season.jsp
	@type			partial
	@author			ncavanagh	
	@note			removed outer mod container
	--------------------------------------------------------------------------------
	--%>
	<c:choose>
	  <c:when test="${(data.aboutSeasonNumber == '1' and data.episodeNextOn.seasonNumber == '1') || (data.aboutSeasonNumber == '1' and data.episodeNextOn == null)}">
			<h2>Where Does The Series Start?</h2>
	  </c:when>
		<c:otherwise>
			<h2>What Happened Last Season?</h2>
		</c:otherwise>
    		</c:choose>
	<p><c:out value='${data.aboutSeasonDesc}'/></p>
	<c:choose>
		<c:when test="${data.aboutSeasonNumber == '1' and (data.episodeLastOn != null || data.episodeNextOn != null)}">
			<p class="episode-guide-link">To get up to date on storylines, <a href="${data.series.baseUrl}/season/${data.aboutSeasonNumber}">check out episode summaries and show scenes.</a></p>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${data.aboutSeasonNumber > '1'}">
					<p class="episode-guide-link">To get up to date on storylines, <a href="${data.series.baseUrl}/season/${data.aboutSeasonNumber}">check out episode summaries and show scenes.</a></p>
				</c:when>
				<c:otherwise> 
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>

