	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/nav/drop_downs/_episode_guide.jsp
	@type			partial
	@author			ncavanagh	
	@desc			episode guide dropdown on series site nav
	@note 			presence of season name overrides season number in display
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="navigationPromotion" value="${data.navigation.navigationPromotion}"/>
	<c:set var="episodeGuideNav" value="${data.navigation.episodeGuideNav}"/>
	<c:set var="episodeGuideNavRows" value="3"/>
	<!-- only 15 episodes (three columns of five) fit properly in our nav template, so we branch and simplify the markup as needed -->
	<c:set var="hasTooManyEpisodes" value="${fn:length(episodeGuideNav.currentSeasonEpisodeNavList[0]) > 15 ? true : false}"/>
	
	<!-- episode guide dropdown -->
	<div id="nav-content-episode-guide" class="nav-content x5">
		<tiles:insertTemplate template="./_promotional_nav_item.jsp">
			<tiles:putAttribute name="promo_key" value="episode" />
		</tiles:insertTemplate>

		<c:if test="${!empty episodeGuideNav.currentSeasonEpisodeNavList && !hasTooManyEpisodes && episodeGuideNav.currentSeasonName == null}">
			<c:forEach var="currentSeasonEpisodeNavList" items="${episodeGuideNav.currentSeasonEpisodeNavList}" varStatus="status" begin="0" end="0">
					<c:set var="currentSeasonDefaultLinkText" value="Season ${episodeGuideNav.currentSeasonNumber}"/>
					<c:set var="currentSeasonLinkText" value="${(episodeGuideNav.currentSeasonName != null) ? episodeGuideNav.currentSeasonName : currentSeasonDefaultLinkText}"/>					
					<div class="nav-col">
						<ul>
							<li><a href="${series.baseUrl}/season/${episodeGuideNav.currentSeasonNumber}"><c:out value="${currentSeasonLinkText}"/></a></li>
							<c:forEach var="currentSeasonEpisodeNav" items="${currentSeasonEpisodeNavList}" begin="0" end="4">
								<li>
									<a href="${series.baseUrl}/season/${episodeGuideNav.currentSeasonNumber}/episode/${currentSeasonEpisodeNav.episodeNumber}">Episode <c:out value="${currentSeasonEpisodeNav.episodeNumber}"/></a>
								</li>
							</c:forEach>
						</ul>
					</div>					
					<c:set var="start" value="5"/>
					<c:set var="addend" value="4"/>
					<c:set var="columns" value="2"/>
					<c:set var="has2ndCol" value="false"/>					
					<!--  Do not render extra columns if the episodes are empty  -->
					<c:if test="${fn:length(currentSeasonEpisodeNavList) > 5}">						
						<c:forEach var="i" begin="1" end="${columns}" step="1" varStatus ="status">
							<c:if test="${! has2ndCol}">
								<div class="nav-col">
									<ul>
										<li><b>&nbsp;</b></li>
										<c:forEach items="${currentSeasonEpisodeNavList}" var="episode"  begin="${start}" end="${start + addend}">
											<li><a href="${series.baseUrl}/season/${episodeGuideNav.currentSeasonNumber}/episode/${episode.episodeNumber}">Episode <c:out value="${episode.episodeNumber}"/></a></li>
										</c:forEach>
									</ul>
								</div>
								<c:set var="start" value="${start + addend + 1}"/>
								<c:set var="has2ndCol" value="${! (fn:length(currentSeasonEpisodeNavList) > 10)}"/>
							</c:if>
						</c:forEach>						
					</c:if>
				</c:forEach>
				<c:forEach var="previousSeasonNavList" items="${episodeGuideNav.previousSeasonNavList}" varStatus="status">
					<c:if test="${!empty previousSeasonNavList}">
						<c:choose>
							<c:when test="${status.count == 1}"><div class="nav-col callout stroke-left"></c:when>
							<c:otherwise><div class="nav-col"></c:otherwise>
						</c:choose>
							<ul>
								<c:forEach var="previousSeasonNav" items="${previousSeasonNavList}">
									<c:set var="seasonDefaultLinkText" value="Season ${previousSeasonNav.seasonNumber}"/>
									<c:set var="seasonLinkText" value="${(previousSeasonNav.seasonName != null) ? previousSeasonNav.seasonName : seasonDefaultLinkText}"/>
									<li>
										<a href="${series.baseUrl}/season/${previousSeasonNav.seasonNumber}"><c:out value="${seasonLinkText}"/></a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
				</c:forEach>
		</c:if>
		
		<!-- if the current season has too many (16 or more) episodes, or if the current season name is used instead of season number,
		     then only draw season names/numbers, and do not break out episodes links for current season -->
		<c:if test="${hasTooManyEpisodes || episodeGuideNav.currentSeasonName != null}">
			<c:set var="start" value="0"/>
			<c:set var="addend" value="4"/>
			<c:set var="columns" value="4"/>
			<c:forEach var="i" begin="1" end="${columns}" step="1" varStatus ="status">
				<div class="nav-col">
					<ul>
						<c:forEach items="${episodeGuideNav.seasonNavList}" var="seasonNavListItem"  begin="${start}" end="${start + addend}">
							<li>
								<c:set var="seasonDefaultLinkText" value="Season ${seasonNavListItem.seasonNumber}"/>
								<c:set var="seasonLinkText" value="${(seasonNavListItem.seasonName != null) ? seasonNavListItem.seasonName : seasonDefaultLinkText}"/>
								<a href="${series.baseUrl}/season/${seasonNavListItem.seasonNumber}"><c:out value="${seasonLinkText}"/></a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<c:set var="start" value="${start + addend + 1}"/>
			</c:forEach>
		</c:if>
	</div>