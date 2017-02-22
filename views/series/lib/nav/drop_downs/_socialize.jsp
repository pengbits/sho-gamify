	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/nav/drop_downs/_socialize.jsp
	@type			partial
	@author			ncavanagh	
	@desc			socialize dropdown on series site nav
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="navigationPromotion" value="${data.navigation.navigationPromotion}"/>
	<c:set var="socialDropdownNavList" value="${data.navigation.socialDropdownNavList}"/>

	<!-- socialize dropdown -->	
	<div id="nav-content-socialize" class="nav-content x4">
		<tiles:insertTemplate template="./_promotional_nav_item.jsp">
			<tiles:putAttribute name="promo_key" value="socialize" />
		</tiles:insertTemplate>
		
		<c:set var="socialDropdownNavListLength" value="0"/>
		<c:forEach items="${socialDropdownNavList}" var="dropdownNavItem">
			<c:if test="${dropdownNavItem.fieldMap.link_text == 'Socialize'}">	
				<c:set var="socialDropdownNavListLength" value="${socialDropdownNavListLength + 1}"/>
			</c:if>
		</c:forEach>
		<c:set var="firstColLength" value="${5 - socialDropdownNavListLength}"/>
		<c:set var="start" value="0"/>
		<c:set var="columns" value="3"/>
		<c:forEach var="i" begin="1" end="${columns}" step="1" varStatus="status">
			<c:set var="addend" value="4"/>
			<div class="nav-col<c:if test='{i.count == 1}'> callout stroke-right</c:if>">
				<ul>
					<c:if test="${status.count == 1}">
						<c:forEach items="${socialDropdownNavList}" var="dropdownNavItem">
							<c:if test="${dropdownNavItem.fieldMap.link_text == 'Socialize'}">	
								<li><a href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
							</c:if>
						</c:forEach>
						<c:set var="addend" value="${firstColLength - 1}"/>
					</c:if>
					<c:forEach items="${data.socialLinkMap}" var="socialLink"  begin="${start}" end="${start + addend}">
						<li><a data-behavior="track-click" data-click-id="navigation:series:community:${fn:toLowerCase(socialLink.value.displayTitle)}" href="${socialLink.value.socialURL}">${socialLink.value.displayTitle}</a></li>
					</c:forEach>
				</ul>
			</div>
			<c:set var="start" value="${start + addend + 1}"/>
		</c:forEach>
	</div>