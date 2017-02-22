	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/nav/drop_downs/_video.mobile.jsp
	@type			partial
	@author			dpaul	
	@desc			# video dropdown on series site nav
	
	# - promo item
	# for...each videoDropdownNavList 
	#	href='link', label='link_text'
	# end                              
	# for...each videoNavItemList      
	#	href='link', label='link_text'
	# end
	--------------------------------------------------------------------------------
	--%>
	<div id="nav-menu-video" class="nav-menu group">
		<ul>
			<tiles:insertTemplate template="./_promotional_nav_item.mobile.jsp">
				<tiles:putAttribute name="promo_key" value="video" />
				<tiles:putAttribute name="promo_label" value="link_copy" />
			</tiles:insertTemplate>
			
		<c:forEach items="${data.navigation.videoDropdownNavList}" var="item">
			<li><a href="${item.fieldMap.link}">${item.fieldMap.link_text}</a></li>
		</c:forEach>
			
		<c:forEach items="${data.navigation.videoNav.videoNavItemList}" var="item">
			<c:set var="seasonDefaultLinkText" value="Season ${item.seasonNumber}"/>
			<c:set var="seasonLinkText" value="${(item.seasonName != null) ? item.seasonName : seasonDefaultLinkText}"/>
			<li><a href="<c:out value='${item.url}'/>">${seasonLinkText}</a></li>
		</c:forEach>
		</ul>
	</div>