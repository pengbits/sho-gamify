	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/nav/drop_downs/_shop.jsp
	@type			partial
	@author			dpaul	
	@desc			shop drop-down on series site nav
	#
	# - promo item
	# for...each shopDropdownNavList 
	#   linkType = 'amazon' if /amazon/; linkType = 'itunes' if /itunes/
	# 	href='link', label='link_text', data-click-id='(linkType)'
	# end
	--------------------------------------------------------------------------------
	--%>
	<div id="nav-menu-shop" class="nav-menu group">
		<ul>
			<tiles:insertTemplate template="./_promotional_nav_item.mobile.jsp">
				<tiles:putAttribute name="promo_key" value="shop" />
				<tiles:putAttribute name="promo_label" value="link_copy" />
			</tiles:insertTemplate>
			
			<c:forEach items="${data.navigation.shopDropdownNavList}" var="item">
				<c:set var="linkType">
				<c:choose>
					<c:when test="${fn:containsIgnoreCase(item.fieldMap.link_text, 'amazon')}">amazon</c:when>
					<c:when test="${fn:containsIgnoreCase(item.fieldMap.link_text, 'itunes')}">itunes</c:when>
					<c:otherwise>shop</c:otherwise>
				</c:choose>
				</c:set>
				<li><a data-behavior="track-click" data-click-id="navigation:${linkType}" href="<c:out value='${item.fieldMap.link}'/>"><c:out value="${item.fieldMap.link_text}"/></a></li>
			</c:forEach>
		</ul>
	</div>