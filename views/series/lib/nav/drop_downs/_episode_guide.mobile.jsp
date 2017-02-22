	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/nav/drop_downs/_episode_guide.jsp
	@type			partial
	@author			dpaul	
	@desc			episode guide drop-down on series site nav
	
	# - promo item
	# for...each episodeGuideNav.seasonNavList 
	# 	href='(/fragment/ + seasonNumber)', label='('Season ' + seasonNumber)'
	# end
	--------------------------------------------------------------------------------
	--%>
	<div id="nav-menu-episode-guide" class="nav-menu group">
		<ul>
			<tiles:insertTemplate template="./_promotional_nav_item.mobile.jsp">
				<tiles:putAttribute name="promo_key" value="episode" />
				<tiles:putAttribute name="promo_label" value="link_copy" />
			</tiles:insertTemplate>
			
			<c:forEach items="${data.navigation.episodeGuideNav.seasonNavList}" var="item">
				<c:set var="seasonDefaultLinkText" value="Season ${item.seasonNumber}"/>
				<c:set var="seasonLinkText" value="${(item.seasonName != null) ? item.seasonName : seasonDefaultLinkText}"/>
				<li><a href="${data.series.baseUrl}/season/${item.seasonNumber}">${seasonLinkText}</a></li>
			</c:forEach>
		</ul>
	</div>