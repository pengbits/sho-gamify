	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/episode_guide/_ways-to-watch.jsp
	@type			partial
	@author			ncavanagh	
	@desc			schedule info for a series episode
	--------------------------------------------------------------------------------
	--%>
	<c:set var="currentEpisode" value="${data.currentEpisode}"/>
	<c:set var="series" value="${data.series}"/>
	<c:set var="waysToWatchFields" value="${data.waysToWatchFields}"/>
	<c:set var="use_all_airings" value="${fn:length(currentEpisode.episode.airingList) > 1}" />
	
	<c:if test="${!empty currentEpisode.episode.videoList}">
		<c:forEach items="${currentEpisode.episode.videoList}" var="video">
			<c:if test="${video.typeCode == 'ful'}">
				<c:set var="fullEpisodeAvailable" value="true"/>
				<c:set var="fullEpisode" value="${video}"/>
			</c:if>
		</c:forEach>	
	</c:if>
				
	<div class="product-schedule ways-to-watch">
		<h2>Ways to Watch</h2>
		<div class="block-list">
			<c:if test="${fullEpisodeAvailable}">
				<div class="entry alt episode-video-list">
					<h3>On SHO.COM</h3>
					<a class="video"  data-click-id="ways_to_watch:free_full_episode" data-behavior="play-video" data-video-id="${fullEpisode.id}" href="${fullEpisode.url}">WATCH FREE FULL EPISODE NOW</a>	
				</div>
			</c:if>
			<div class="entry">
				<h3>On TV</h3>
				<div class="entry-details">
				<c:choose>
					<c:when test="${!empty currentEpisode.episode.nextOn}">
						Next:  
						<c:set var="nextOnDate" value="${currentEpisode.episode.nextOn.roundedStartDate}"/>
						<fmt:formatDate pattern="EEE, MMM d, h:mm a" value="${nextOnDate}" /> ET/PT<br /> 
						on <c:out value="${currentEpisode.episode.nextOn.channel.name}" /><br />
						<c:if test="${use_all_airings}"><span class="raquo">&raquo;</span><a class="disclosure all-airings" href="${currentEpisode.airingsUrl}">Upcoming Airings</a></c:if>
					</c:when>
					<c:otherwise>No upcoming airings</c:otherwise>
				</c:choose>
				</div>
			</div>			
			<div class="entry alt">
				<h3>On Demand</h3>
				<c:choose>
					<c:when test="${!empty currentEpisode.episode.onDemand}">
						<c:out value="${currentEpisode.episode.onDemand.startDate}" />-<c:out value="${currentEpisode.episode.onDemand.endDate}" /><br />
						<c:set var="onDemandSlug" value="#/series/${series.id}/${fn:substringAfter(series.baseUrl,'/sho/')}"/>
						<span class="raquo">&raquo;</span><a data-behavior="track-click" data-click-id="ways_to_watch:on_demand"  href="${currentEpisode.episode.onDemand.url}/${onDemandSlug}">Schedule</a>
					</c:when>
					<c:otherwise>Not available</c:otherwise>
				</c:choose>		
			</div>			
			<div class="entry">
				<h3>Showtime Anytime</h3>
				<c:choose>
					<c:when test="${!empty currentEpisode.episode.anyTime}">
						<c:out value="${currentEpisode.episode.anyTime.startDate}" /> - <c:out value="${currentEpisode.episode.anyTime.endDate}" />
						<br /><span class="raquo">&raquo;</span><a data-behavior="track-click" data-click-id="ways_to_watch:showtime_anytime" href="${currentEpisode.episode.anyTime.url}" class="link">watch now</a>
					</c:when>
					<c:otherwise>Not available<br /><span class="raquo">&raquo;</span><a data-behavior="track-click" data-click-id="ways_to_watch:showtime_anytime" href="/sho/showtime-anytime" class="link">learn more</a></c:otherwise>
				</c:choose>
			</div>
			<div class="entry alt">
				<h3>Don't Have Showtime?</h3>
				<span class="raquo">&raquo;</span><a href="/sho/order/home" data-click-id="ways_to_watch:link_order" data-behavior="track-click">Order Now</a>
			</div>
			<c:if test="${!empty currentEpisode.episode.productVideoList}">
				<div class="entry">
					<h3>Own this episode:</h3>
					<c:set var="partner_names" value="iTunes,Amazon,Vudu,Google Play,Sony" />
					<c:forTokens items="${partner_names}" delims="," var="partnerName">
						<%-- 'coerce partnerName into display form' --%>
						<c:set var="partner_name" value="${fn:replace(partnerName, 'Amazon', 'Amazon Instant Video')}" />
						<c:set var="partner_name" value="${fn:replace(partner_name, 'Vudu', 'VUDU')}" />
						<c:set var="partner_name_lowercase" value="${fn:toLowerCase(partnerName)}" />
						<ul class="block-list">
						<c:forEach items="${currentEpisode.episode.productVideoList}" var="product">
							<c:forEach items="${product.partnerLinkSet}" var="partnerLinkSet">
							<c:if test="${partnerLinkSet.partner.name == partnerName}">
								<li><span class="raquo">&raquo;</span><a data-behavior="track-click" data-click-id="ways_to_watch:${partner_name_lowercase}" href="${partnerLinkSet.link}">${partner_name}</a></li>
							</c:if>
							</c:forEach>
						</c:forEach>
						</ul>
					</c:forTokens>
				</div>
			</c:if>
		</div>
	</div>