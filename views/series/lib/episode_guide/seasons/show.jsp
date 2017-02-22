	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/episode_guide/index_season.jsp
	@type			page
	@author			ncavanagh	
	@desc			# series season landing page
	@note 			# modified to use new videoList property instead of individual free ep / preview properties. 
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="seriesSeasonEpNav" value="${data.seriesSeasonEpNav}"/>
	<c:set var="seasonView" value="${data.seasonView}"/>
	<c:set var="waysToWatchFields" value="${data.waysToWatchFields}"/>
	
	<%--  add doubleclick tags for select series --%>
	<c:set var="hasDoubleClick" value="true"/>
	<c:choose>
		<c:when test="${series.id == 323}"><%-- Dexter	--%>
			<c:set var="doubleClickUrl" value="http://2201481.fls.doubleclick.net/activityi;src=2201481;type=episd558;cat=dexte570;ord="/>
		</c:when>
		<c:when test="${series.id == 1002742}"><%-- Ray Donovan --%>
			<c:set var="doubleClickUrl" value="http://2201481.fls.doubleclick.net/activityi;src=2201481;type=episd558;cat=raydo132;ord="/>
		</c:when>
		<c:when test="${series.id == 804}"><%-- Homeland --%>
			<c:set var="doubleClickUrl" value="http://2201481.fls.doubleclick.net/activityi;src=2201481;type=episd558;cat=homel545;ord="/>
		</c:when>
		<c:otherwise><c:set var="hasDoubleClick" value="false"/></c:otherwise>
		<%-- if more of these are requested, consider alternate implementation, i.e. config XML --%>
	</c:choose>
	<c:if test="${hasDoubleClick}">
		<jsp:include page="/lib/views/pixels/_pixel_doubleclick.jsp">
			<jsp:param name='doubleclickTagUrl' value='${doubleClickUrl}' />			
		</jsp:include>
	</c:if>
	
	<tiles:insertDefinition name="series.tune-in" />
	
		<tiles:insertDefinition name="modules.social.seeit_reminder">
			<tiles:putAttribute name="classname" value="seeit-reminder--docked" />
		</tiles:insertDefinition>
	
	<c:if test="${fn:length(seriesSeasonEpNav.seasonNavList) > 1}">
		<div class="episode-guide-nav clearfix">
			<div id="season-nav" class="dropdown">
				<!--<p>alternate content</p>-->
			</div>
		</div>
		
		<c:set var="selectedSeasonDefaultLinkText" value="Season ${seasonView.number}"/>
		<c:set var="selectedSeasonText" value="${(seasonView.name != null) ? seasonView.name : selectedSeasonDefaultLinkText}"/>
			<script type="text/javascript">
				sho.provide('sho.series.seasons');
				sho.series.seasons = {
					'seriesRelativeURL' : '${series.baseUrl}',
					'container' : 'season-nav',
					'title' : '${selectedSeasonText}',
					'seasonList' : $H({
						<c:forEach items="${seriesSeasonEpNav.seasonNavList}" var="seasonNav" varStatus="i">
						<c:set var="currentSeasonDefaultLinkText" value="Season ${seasonNav.seasonNumber}"/>
						<c:set var="currentSeasonLinkText" value="${(seasonNav.seasonName != null) ? seasonNav.seasonName : currentSeasonDefaultLinkText}"/>
						"${currentSeasonLinkText}":"${seasonNav.seasonNumber}"
						<c:if test="${!i.last}">,</c:if></c:forEach>
					})
				};		  
			</script>
	</c:if>

	<div class="season-content">
		<div class="season-wrap clearfix">
			<img class="key-art" src="http://www.sho.com${seasonView.image.path}" alt="" />
			<div class="season-desc">
				<c:set var="currentSeasonDefaultText" value="SEASON ${seasonView.number}"/>
				<c:set var="currentSeasonText" value="${(seasonView.name != null) ? seasonView.name : currentSeasonDefaultText}"/>
				<h2>${currentSeasonText}</h2>
				<p>${seasonView.longDescription}</p>
				<ul>
					<c:forEach items="${data.seasonView.videoList}" var="video">
						<c:set var="label" value="season ${seasonView.number} preview" />
						<c:if test="${video.typeCode == 'ful'}"><c:set var="label" value="free full episode" /></c:if>
						<li><a class="video" data-behavior="play-video" data-video-id="${video.id}" href="${video.url}">${label}</a></li>
					</c:forEach>
					<c:if test="${!empty data.navigation.videoNav.videoNavItemList}">
						<li class="season-video-link"><span class="raquo">&raquo;</span>
							<a href="${series.baseUrl}/video/season/${seasonView.number}">
								<c:set var="seasonDefaultLinkText" value="Season ${seasonView.number}"/>
								<c:set var="seasonLinkText" value="${(seasonView.name != null) ? seasonView.name : seasonDefaultLinkText}"/>
								<c:if test="${!empty data.seasonView.videoList}">more </c:if>${seasonLinkText} videos</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
		<c:if test="${!empty seasonView.episodeList}">
		<div class="season-schedule grid">
			<div class="all-times">All times <span class="etpt">ET/PT</span></div>
			<div class="table">
				<div class="th">
					<div class="td episodes">episodes</div>
					<div class="td airings">on tv</div>
					<div class="td od">on demand</div>
					<div class="td anytime">showtime anytime</div>
					<div class="td last own">own</div>
				</div>
				<c:forEach items="${seasonView.episodeList}" var="episodeList" varStatus="status">
					<div class="tr<c:if test="${status.count % 2 == 0}"> alternate</c:if>">
						<div class="td episodes">
							<a href="${episodeList.episode.url}">${episodeList.episode.contextualTitle}</a><br/>
							<c:if test="${!empty episodeList.episode.video}">
								<a class="video" data-behavior="play-video" data-video-id="${episodeList.episode.video.id}" href="${episodeList.episode.video.url}">preview</a>
							</c:if>
						</div>
						<div class="td airings">
							<c:choose>
								<c:when test="${!empty episodeList.episode.nextOn}">
								<div class="airings-wrap clearfix">
									<div class="airdate">
										<c:set var="airDate" value="${episodeList.episode.nextOn.roundedStartDate}"/>
										<span><fmt:formatDate pattern="EEE, MMM d, h:mm a" value="${airDate}" /></span>
										<br/>
										<span class="raquo">&raquo;</span><a rel="${episodeList.episode.episodeNumber}" class="disclosure all-airings link" href="${episodeList.airingsUrl}">Upcoming airings</a>
									</div>
									<div class="channel">${episodeList.episode.nextOn.channel.name}</div>
								</div>
								</c:when>
								<c:otherwise><div class="airdate"><span class="no-text-transform">No upcoming airings</span></div></c:otherwise>
							</c:choose>
						</div>
						<div class="td od">
							<c:choose>
								<c:when test="${!empty episodeList.episode.onDemand.startDate}">
									${episodeList.episode.onDemand.startDate}-${episodeList.episode.onDemand.endDate}
								</c:when>
								<c:otherwise><span class="no-text-transform">Not available</span></c:otherwise>
							</c:choose>
						</div>
						<div class="td anytime">
							<c:choose>
								<c:when test="${!empty episodeList.episode.anyTime.startDate}">
									${episodeList.episode.anyTime.startDate}-${episodeList.episode.anyTime.endDate}<br/>
									<span class="raquo">&raquo;</span><a href="${episodeList.episode.anyTime.url}" class="link">watch now</a>
									<!--
									<c:if test="${waysToWatchFields.showtimeAnytimeLink != 'false'}">
										<span class="raquo">&raquo;</span><a href="<c:out value = '${waysToWatchFields.showtimeAnytimeLink}'/>" class="link">learn more</a>
									</c:if>-->
								</c:when>
								<c:otherwise><span class="no-text-transform">Not available</span></c:otherwise>
							</c:choose>
						</div>
						<div class="td last own">
							<c:choose>
								<c:when test="${!empty episodeList.episode.productVideoList}">
									<c:set var="partner_names" value="iTunes,Amazon,Vudu,Google Play,Sony" />
									<c:forTokens items="${partner_names}" delims="," var="partnerName">
										<%-- 'coerce partnerName into display form' --%>
										<c:set var="partner_name" value="${fn:replace(partnerName, 'Amazon', 'Amazon Instant Video')}" />										
										<c:set var="partner_name" value="${fn:replace(partner_name, 'Vudu', 'VUDU')}" />
										<c:set var="partner_name_lowercase" value="${fn:toLowerCase(partnerName)}" />
										<ul>
										<c:forEach items="${episodeList.episode.productVideoList}" var="product">
											<c:forEach items="${product.partnerLinkSet}" var="partnerLinkSet">
											<%--<c:if test="${partnerLinkSet.partner.name == partnerName}">
												rest action returning different values for Amazon so a less specific test needed to be used.
											--%>
											<c:if test="${fn:indexOf(partnerLinkSet.partner.name, partnerName) != -1}">											
												<li><a data-behavior="track-click" data-click-id="ways_to_watch:${partner_name_lowercase}" href="${partnerLinkSet.link}">${partner_name}</a></li>
											</c:if>
											</c:forEach>
										</c:forEach>
										</ul>
									</c:forTokens>
								</c:when>
								<c:otherwise><span class="no-text-transform">Not available</span></c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			</div>	
		</div>
		</c:if>
	</div>
	