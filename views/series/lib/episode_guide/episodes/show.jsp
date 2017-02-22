	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/episode_guide/episodes/show.jsp
	@type			page
	@author			ncavanagh	
	@desc			series episode page
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
	<c:set var="episodeHasMusicDownloads" value="false"/>
	<c:set var="episodeRecaps" value="${data.episodeModule}"/>
	<c:set var="addSpacerImg" value="<img src='/assets/images/lib/clear_1024x576.png' width='100%' height='1' />" />
	<c:set var="addDescritionWidth">
		<c:choose>
			<c:when test="${currentEpisode.episode.isUpcoming && fn:length(currentEpisode.episode.shortDescription) < 180}">true</c:when>
			<c:when test="${fn:length(currentEpisode.episode.longDescription) < 180}">true</c:when>
		</c:choose>	
	</c:set>

	<c:if test="${socializePromoFields.getGluePartialURL != 'false'}">
		<c:set var="getGluePartial" value="${fn:substringAfter(socializePromoFields.getGluePartialURL,'.com/')}"/>
	</c:if>
	
	<c:if test="${!empty data.currentEpisode && !empty data.currentEpisode.episode}">
	<tiles:insertDefinition name="modules.episode_guide.schema_writer">
		<tiles:putAttribute name="episode" 		value="${currentEpisode.episode}" />
		<tiles:putAttribute name="series"		value="${series}" />
		<tiles:putAttribute name="schedule"		value="${currentEpisode.episode.scheduleView}" />
	</tiles:insertDefinition>
	</c:if>
	
	<div class="two-col-25-75 group product" itemscope itemtype="http://schema.org/TVEpisode">
		<meta itemprop="episodeNumber" content="${data.currentEpisode.episode.episodeNumber}" />
		<meta itemprop="partOfSeason" content="${data.currentEpisode.episode.seasonNumber}" />
	
		<div class="ep-col1 c1">
			<tiles:insertDefinition name="series.tune-in" />
			<tiles:insertDefinition name="series.episode.ways-to-watch" />
			<c:if test="${!empty customValueMap['storeView']}">
				<tiles:insertDefinition name="series.in-the-store.default">
					<tiles:putAttribute name="view" value="${customValueMap['storeView']}" />
					<tiles:putAttribute name="context" value="episode" />
				</tiles:insertDefinition>		
			</c:if>
		</div>
		<div class="ep-col2 c2">
			<div class="episode-guide-nav clearfix">
				<c:if test="${fn:length(seriesSeasonEpNav.seasonNavList) > 1}">
					<div id="season-nav" class="dropdown clearfix">
						<!--<p>alternate content</p>-->
					</div>
				</c:if>
				<div id="episode-nav" class="dropdown clearfix">
					<!--<p>alternate content</p>-->
				</div>
			<c:set var="selectedSeasonDefaultLinkText" value="Season ${currentEpisode.episode.seasonNumber}"/>
			<c:set var="selectedSeasonText" value="${(currentEpisode.episode.seasonName != null) ? currentEpisode.episode.seasonName : selectedSeasonDefaultLinkText}"/>
			<script type="text/javascript">
				sho.provide('sho.series.seasons');
				sho.series.seasons = {
					'container' : 'season-nav',
					'title' :  '${selectedSeasonText}',
					'current' :  '${currentEpisode.episode.seasonNumber}',
					'seasonList' : $H({
						<c:forEach items="${seriesSeasonEpNav.seasonNavList}" var="seasonNav" varStatus="i">
						<c:set var="seasonDefaultLinkText" value="Season ${seasonNav.seasonNumber}"/>
						<c:set var="seasonLinkText" value="${(seasonNav.seasonName != null) ? seasonNav.seasonName : seasonDefaultLinkText}"/>
                        <c:set var="seasonLink" value="${series.baseUrl}/season/${seasonNav.seasonNumber}/episode/${seasonNav.episodeNavList[0].episodeNumber}"/>
						"${seasonLinkText}":"${seasonLink}"
						<c:if test="${!i.last}">,</c:if></c:forEach>
					})
				};		
				sho.provide('sho.series.episodes');
				sho.series.episodes = {
					'seriesRelativeURL' : '${series.baseUrl}',
					'container' : 'episode-nav',
					'current' :  '${currentEpisode.episode.episodeNumber}',
					'episodeList' : $H({
						<c:forEach items="${seriesSeasonEpNav.seasonNavList}" var="seasonNav">
							<c:if test="${seasonNav.currentSeason == true}">
								<c:forEach items="${seasonNav.episodeNavList}" var="episode" varStatus="i">
									"Episode ${episode.episodeNumber}":"${episode.episodeNumber}"
									<c:if test="${!i.last}">,</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					})
				};
			</script>
		</div>
		<div class="product-overview-wrap">
			<div class="product-overview group">
					<!-- artwork -->
					<div class="left product-art">
						<c:if test='${!empty currentEpisode.episode.imageList}'><a href="#/images"></c:if>
							<img src="http://www.sho.com${currentEpisode.episode.image.path}" itemprop="image" />
							<c:if test='${!empty currentEpisode.episode.imageList}'><span class="slideshow-icon"><b>.</b> ${fn:length(currentEpisode.episode.imageList)} Photos</span></c:if>
						<c:if test='${!empty currentEpisode.episode.imageList}'></a></c:if>
					</div>
				
					<!-- description -->
					<div class="right product-desc">
						<h2 itemprop="name"><c:out value="${currentEpisode.episode.displayTitle}" /></h2>
						<p itemprop="description">
						<c:choose>
							<c:when test="${currentEpisode.episode.isUpcoming}">
								<c:out value="${currentEpisode.episode.shortDescription}" />
							</c:when>	
							<c:otherwise>
								<c:out value="${currentEpisode.episode.longDescription}" />
							</c:otherwise>
						</c:choose>
						<c:if test="${addDescritionWidth}">${addSpacerImg}</c:if>
						</p>
					
						<!-- video list -->
						<c:if test="${!empty currentEpisode.episode.videoList}">
							<%-- 'conditionals aroind video.typeCode are not intended to exclude any videos, they just enforce an order' --%>
							<ul class="episode-video-list">
								<c:forEach items="${currentEpisode.episode.videoList}" var="video">
									<li><a class="video" data-behavior="play-video" data-video-id="${video.id}" href="${video.url}">${video.title}</a></li>
								</c:forEach>
							</ul>
						</c:if>
					
						<!-- social sharing -->	
						<tiles:insertDefinition name="modules.social.sharing_inline">
							<tiles:putAttribute name="shareUrl" value="${series.baseUrl}/season/${currentEpisode.episode.seasonNumber}/episode/${currentEpisode.episode.episodeNumber}" />
							<tiles:putAttribute name="headline" value="" /></tiles:insertDefinition>
					
					
						<c:if test="${currentEpisode.episode.id == 3364059}">
							<br/>
							<p>
								Union Bank&reg; is not affiliated or related in any way to the Union Banking Corporation referred to in this episode.
							</p>
						</c:if>
					</div>
				</div>
			
				<!-- credits -->
				<c:choose>
				<c:when test="${empty currentEpisode.episode.writerCastList && empty currentEpisode.episode.directorCastList && empty currentEpisode.episode.actorCastList}">
				</c:when>
				<c:otherwise>
					<div class="group product-meta credits">
						<span class="stats left">
							<c:if test="${!empty currentEpisode.episode.writerCastList}">
								<c:forEach items="${currentEpisode.episode.writerCastList}" var="writerCast" varStatus="count">
									<p><b>${writerCast.credit}: </b>
									<c:set var="writerNameAndArticle" value="${writerCast.talent.name} ${writerCast.article} "/>
									<c:out value="${writerNameAndArticle}" /> 
								</c:forEach>
							</c:if>
							<c:if test="${!empty currentEpisode.episode.directorCastList}">
								<c:forEach items="${currentEpisode.episode.directorCastList}" var="directorCast">
									<p itemprop="director" itemscope itemtype="http://schema.org/Person"><b>Directed By: </b>
										<span itemprop="name"><c:out value="${directorCast.talent.name}" /></span></p>
								</c:forEach>
							</c:if>
						</span>	
						<span class="stats right">
							<c:if test="${!empty currentEpisode.episode.actorCastList}">
								<c:forEach items="${currentEpisode.episode.actorCastList}" var="actorCast">
									<c:if test="${!empty actorCast.credit}">
										<p itemprop="actor" itemscope itemtype="http://schema.org/Person">
											<b><c:out value="${actorCast.credit}" />: </b><span itemprop="name"><c:out value="${actorCast.talent.name}" /></span></p>
									</c:if>
								</c:forEach>
							</c:if>
						</span>
					</div>
				</c:otherwise>
				</c:choose>
			
				<%-- external content (episode recaps) --%>							
				<c:if test="${!empty episodeRecaps}">
					<tiles:insertDefinition name="modules.external_content">
						<tiles:putAttribute name="data_array" value="${episodeRecaps}" />
					</tiles:insertDefinition>
				</c:if>										
						
				<!-- details -->
				<div class="group product-meta misc">
					<span class="stats left">
						<p>	
							<c:if test="${!empty currentEpisode.episode.shoAdvisorySet}">
							<b>Showtime Advisories</b><br/>
							<c:forEach items="${currentEpisode.episode.shoAdvisorySet}" var="shoAdvisorySet" varStatus="i">
								<c:out value="${shoAdvisorySet}" /><c:if test="${!i.last}">, </c:if>
							</c:forEach>
							</c:if>
						</p>
					</span>
					<span class="stats right">
						<div class="table">
							<c:if test="${!empty currentEpisode.episode.lengthMinutes}"><p class="td"><b>Duration</b><br/>${currentEpisode.episode.lengthMinutes} min.</p></c:if>
							<c:if test="${!empty currentEpisode.episode.rating}"><p class="td"><b>Rating</b><br/><span itemprop="contentrating">${currentEpisode.episode.rating}</span></p></c:if>	
						</div>
					</span>
				</div>				
				<!-- music -->
				<c:if test="${!empty currentEpisode.episode.productAudioList && !currentEpisode.episode.isUpcoming}">
					<div class="group product-meta music" itemscope itemtype="http://schema.org/MusicRecording">
						<h2>Music From This Episode</h2>
						<c:forEach items="${currentEpisode.episode.productAudioList}" var="product" varStatus="status">
							<c:if test="${!empty product.partnerLinkSet}">
								<c:set var="episodeHasMusicDownloads" value="true"/>
							</c:if>
						</c:forEach>
						<div class="product-music grid<c:if test='${episodeHasMusicDownloads != true}'> no-download</c:if>">
							<div class="table">
								<div class="th">
									<div class="td title">song title</div>
									<div class="td performer">performed by</div>
									<c:if test="${episodeHasMusicDownloads == true}">
										<div class="td performer">more</div>
									</c:if>
								</div>
								<c:forEach items="${currentEpisode.episode.productAudioList}" var="product" varStatus="status">
									<div class="tr<c:if test="${status.count % 2 == 0}"> alternate</c:if>">
										<div class="td title"><!--clearfix caused spacing issues in FireFox, removing did not change layout in other browsers-->
											<span class="product-title" itemprop="name">${product.title}</span>
											<c:catch var="exception"><c:set var="titleId" value="${product.titleId}"/></c:catch>
											<c:choose>
												<c:when test="${empty exception}">
													<%--<a class="audio-file play-button" rel="${product.id}">play</a>
													<a class="audio-file song-title" rel="${product.id}">${product.title}</a>--%>
													${product.title}
												</c:when>
												<c:otherwise>${product.title}</c:otherwise>	
											</c:choose>
											</div>
										<div class="td performer" itemprop="byArtist">${product.artist}</div>
										<c:if test="${episodeHasMusicDownloads == true}">
											<div class="td download">
												<c:forEach items="${product.partnerLinkSet}" var="links" varStatus="i">
														<c:if test="${i.last}"><a href="${links.link}">${links.partner.name}</a></c:if>
												</c:forEach>
											</div>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</div>	
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		// handle user change events that accompany nitro opt-in or login/logout following an opt-in call
	sho.dom.ready(function(){
		sho.dom.bind('user:loaded:authenticated', function(){
			sho.accounts.nitro.optInPending() && sho.gamify.showConfirmUI()
		})
		sho.dom.bind('user:gamify:optin', function(){
			window.location.reload();
		})
	})

	</script>
	
	<jsp:include page="/schedules/views/titles/_image_list.json.jsp" />


