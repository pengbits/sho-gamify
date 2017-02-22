	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/nav/drop_downs/_socialize.jsp
	@type			partial
	@author			dpaul	
	@desc			# socialize dropdown menu in series site nav
	
	# - promo item
	# for...each socialDropdownNavList { href='link', label='link_text' }
	--------------------------------------------------------------------------------
	--%>
	<c:set var="socialDropdownNavList" value="${data.navigation.socialDropdownNavList}"/>
	<div id="nav-menu-socialize" class="nav-menu group">
		<ul>
		<tiles:insertTemplate template="./_promotional_nav_item.mobile.jsp">
			<tiles:putAttribute name="promo_key" value="socialize" />
			<tiles:putAttribute name="promo_label" value="link_copy" />
		</tiles:insertTemplate>
		<c:forEach items="${socialDropdownNavList}" var="dropdownNavItem">
			<c:if test="${dropdownNavItem.fieldMap.link_text == 'Socialize'}">	
				<li><a href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
			</c:if>
		</c:forEach>
		<c:forEach items="${data.socialLinkMap}" var="socialLink">
			<li><a data-behavior="track-click" data-click-id="navigation:series:community:${fn:toLowerCase(socialLink.value.displayTitle)}" href="${socialLink.value.socialURL}">${socialLink.value.displayTitle}</a></li>
		</c:forEach>
		</ul>
	</div>