	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/nav/drop_downs/_video.jsp
	@type			partial
	@author			ncavanagh	
	@desc			video dropdown on series site nav
	@note			logic is used to keep the number of rows in each column consistent regardless
					of number of PCE-driven promoted links
	--------------------------------------------------------------------------------
	--%>
	<c:set var="navigationPromotion" value="${data.navigation.navigationPromotion}"/>
	<c:set var="videoNavItemList" value="${data.navigation.videoNav.videoNavItemList}"/>
	<c:set var="videoDropdownNavList" value="${data.navigation.videoDropdownNavList}"/>

	<!-- video dropdown -->
	<c:if test="${!empty videoNavItemList}">
		<div id="nav-content-video" class="nav-content x4">
			<tiles:insertTemplate template="./_promotional_nav_item.jsp">
				<tiles:putAttribute name="promo_key" value="video" />
			</tiles:insertTemplate>

				<div class="nav-col callout stroke-right">
					<ul>
						<c:set var="promotedLinksLength" value="${fn:length(videoDropdownNavList)}"/>
						<c:set var="start" value="0"/>
						<c:set var="firstColEnd" value="${4 - promotedLinksLength}"/>
						<c:set var="addend" value="5"/>
						<c:set var="columns" value="3"/>
						
						<c:forEach items="${videoDropdownNavList}" var="dropdownNavItem">
					    	<li><a href="${dropdownNavItem.fieldMap.link}">${dropdownNavItem.fieldMap.link_text}</a></li>
						</c:forEach>
						<c:forEach items="${videoNavItemList}" var="videoNavItem" begin="0" end="${firstColEnd}">
							<c:set var="seasonDefaultLinkText" value="Season ${videoNavItem.seasonNumber}"/>
							<c:set var="seasonLinkText" value="${(videoNavItem.seasonName != null) ? videoNavItem.seasonName : seasonDefaultLinkText}"/>
							<li><a href="<c:out value='${videoNavItem.url}'/>">${seasonLinkText}</a></li>
						</c:forEach>
					</ul>
				</div>
						
				<c:set var="start" value="${firstColEnd + 1}"/>
				
				<c:forEach var="i" begin="1" end="${columns}" step="1" varStatus ="status">
					<div class="nav-col">
						<ul>
							<c:forEach items="${videoNavItemList}" var="videoNavItem" begin="${start}" end="${start + addend-1}">
								<c:set var="seasonDefaultLinkText" value="Season ${videoNavItem.seasonNumber}"/>
								<c:set var="seasonLinkText" value="${(videoNavItem.seasonName != null) ? videoNavItem.seasonName : seasonDefaultLinkText}"/>
								<li><a href="<c:out value='${videoNavItem.url}'/>">${seasonLinkText}</a></li>

							</c:forEach>
						</ul>
					</div>
					<c:set var="start" value="${start + addend}"/>
				</c:forEach>
			
		</div>
	</c:if>