	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series ways to watch
	@file			series/lib/views/_ways_to_watch.jsp
	@type			partial
	@author			ncavanagh	
	@desc			series-level (not season/episode specific)
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="waysToWatchFields" value="${data.waysToWatchFields}"/>
	
	<c:choose>
		<c:when test="${waysToWatchFields.isOnDemand != 'false' ||
						waysToWatchFields.isOnAnytime != 'false' || 
						waysToWatchFields.isOnLinearSchedule != 'false' || 
						waysToWatchFields.iTunesLink != null || 
						waysToWatchFields.dvdPromoLink != null || 
						waysToWatchFields.amazonLink != null || 
						waysToWatchFields.vuduLink != null }">
			<c:set var="waysToWatch" value="true"/>
		</c:when>
		<c:otherwise>
			<c:set var="waysToWatch" value="false"/>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${waysToWatchFields.isOnLinearSchedule != 'false' || 
						waysToWatchFields.isOnDemand != 'false' || 
						waysToWatchFields.isOnAnytime != 'false' }">
			<c:set var="waysToWatchViaOrder" value="true"/>
		</c:when>
		<c:otherwise>
			<c:set var="waysToWatchViaOrder" value="false"/>
		</c:otherwise>
	</c:choose>
	<c:if test="${waysToWatch != 'false'}">
		<div class="ways-to-watch">
			<h2>Ways To Watch</h2>
			<c:if test="${waysToWatchViaOrder != 'false'}">
				<ul>
					<c:if test="${waysToWatchFields.isOnLinearSchedule != 'false'}">
						<c:choose>
							<c:when test="${data.navigation.episodeGuideNav != null}">
								<li class="watch-on-tv"><a data-behavior="track-click" data-click-id="ways_to_watch:on_tv"  
									href="${waysToWatchFields.linearUrl}">On TV</a></li>
							</c:when>
							<c:otherwise>
								<li class="watch-on-tv airings-html"><a href="${waysToWatchFields.linearUrl}">On TV</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${waysToWatchFields.isOnDemand != 'false'}"><%-- # this could be `/sho/schedules/ondemand/sports/1003022/60-minutes-sports` or `/sho/schedules/ondemand/series/408/californication`  --%>
						<c:set var="ondemand_series_slug" 	value="${fn:substringAfter(series.baseUrl,'/sho/')}"/>
						<c:set var="ondemand_category" 		value="${fn:contains(waysToWatchFields.onDemandUrl, '/ondemand/sports') ? 'sports' : 'series'}" />
						<c:set var="ondemand_url" 			value="/sho/schedules/ondemand/${ondemand_category}#/series/${series.id}/${ondemand_series_slug}" />
		     			<li class="watch-on-demand">
							<a data-behavior="track-click" data-click-id="ways_to_watch:on_demand" href="${ondemand_url}">On Demand</a>
						</li>
					</c:if>
					<c:if test="${waysToWatchFields.isOnAnytime != 'false'}">
						<li><a data-behavior="track-click" data-click-id="ways_to_watch:showtime_anytime" href="/sho/showtime-anytime">Showtime Anytime</a></li>
					</c:if>
					<li class="order-now"><a data-click-id="ways_to_watch:link_order" href="/sho/order/home" data-behavior="track-click">Order Now</a></li>
				</ul>
			</c:if>
			<tiles:insertDefinition name="modules.social.seeit_reminder" />
			<c:if test="${waysToWatchFields.iTunesLink != null || waysToWatchFields.googlePlayLink != null || waysToWatchFields.dvdPromoLink != null || waysToWatchFields.amazonLink != null || waysToWatchFields.vuduLink != null}">
				<ul class="ways-to-own">
					<li class="own-this-series">Own this series:</li>
					<c:if test="${waysToWatchFields.iTunesLink != null}">
						<li><a data-behavior="track-click" data-click-id="ways_to_watch:itunes" href="<c:out value = '${waysToWatchFields.iTunesLink}'/>">iTunes</a></li>	
					</c:if>
					<c:if test="${waysToWatchFields.amazonLink != null}">
						<li><a data-behavior="track-click" data-click-id="ways_to_watch:amazon" href="<c:out value = '${waysToWatchFields.amazonLink}'/>">Amazon Instant Video</a></li>
					</c:if>
					<c:if test="${waysToWatchFields.vuduLink != null}">
						<li><a data-behavior="track-click" data-click-id="ways_to_watch:vudu" href="<c:out value = '${waysToWatchFields.vuduLink}'/>">VUDU</a></li>
					</c:if>
					<c:if test="${waysToWatchFields.googlePlayLink != null}">
						<li><a data-behavior="track-click" data-click-id="ways_to_watch:google play" href="<c:out value = '${waysToWatchFields.googlePlayLink}'/>">Google Play</a></li>
					</c:if>
					<c:if test="${waysToWatchFields.sonyLink != null}">
						<li><a data-behavior="track-click" data-click-id="ways_to_watch:sony" href="<c:out value = '${waysToWatchFields.sonyLink}'/>">Sony Entertainment Network</a></li>
					</c:if>
					<c:if test="${waysToWatchFields.dvdPromoLink != null}">
						<li><a data-behavior="track-click" data-click-id="ways_to_watch:shop" href="<c:out value = '${waysToWatchFields.dvdPromoLink}'/>">DVD</a></li>		
					</c:if>
				</ul>
			</c:if>
		</div>
	</c:if>