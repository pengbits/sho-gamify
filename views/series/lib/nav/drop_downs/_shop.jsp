	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/nav/drop_downs/_shop.jsp
	@type			partial
	@author			ncavanagh	
	@desc			shop dropdown on series site nav
	--------------------------------------------------------------------------------
	--%>
	<c:set var="navigationPromotion" value="${data.navigation.navigationPromotion}"/>
	<c:set var="shopDropdownNavList" value="${data.navigation.shopDropdownNavList}"/>

	<!-- shop dropdown -->
	<c:if test="${!empty shopDropdownNavList}">
		<div id="nav-content-shop" class="nav-content x4">
			<tiles:insertTemplate template="./_promotional_nav_item.jsp">
				<tiles:putAttribute name="promo_key" value="shop" />
			</tiles:insertTemplate>
			<div class="nav-col">
				<ul>
					<c:forEach items="${shopDropdownNavList}" var="dropdownNavItem" begin="0" end="4">
						<c:choose>
							<c:when test="${fn:containsIgnoreCase(dropdownNavItem.fieldMap.link_text, 'amazon')}">
								<c:set var="dataClickId" value="navigation:amazon"/>
							</c:when>
							<c:when test="${fn:containsIgnoreCase(dropdownNavItem.fieldMap.link_text, 'itunes')}">
								<c:set var="dataClickId" value="navigation:itunes"/>
							</c:when>
							<c:otherwise>
								<c:set var="dataClickId" value="navigation:shop"/>
							</c:otherwise>
						</c:choose>
						<li><a data-behavior="track-click" data-click-id="<c:out value='${dataClickId}'/>" href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="nav-col">
				<ul>
					<c:forEach items="${shopDropdownNavList}" var="dropdownNavItem" begin="5" end="9">
						<c:choose>
							<c:when test="${fn:containsIgnoreCase(dropdownNavItem.fieldMap.link_text, 'amazon')}">
								<c:set var="dataClickId" value="navigation:amazon"/>
							</c:when>
							<c:when test="${fn:containsIgnoreCase(dropdownNavItem.fieldMap.link_text, 'itunes')}">
								<c:set var="dataClickId" value="navigation:itunes"/>
							</c:when>
							<c:otherwise>
								<c:set var="dataClickId" value="navigation:shop"/>
							</c:otherwise>
						</c:choose>
						<li><a data-behavior="track-click" data-click-id="<c:out value='${dataClickId}'/>" href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="nav-col">
				<ul>
					<c:forEach items="${shopDropdownNavList}" var="dropdownNavItem" begin="10" end="14">
						<c:choose>
							<c:when test="${fn:containsIgnoreCase(dropdownNavItem.fieldMap.link_text, 'amazon')}">
								<c:set var="dataClickId" value="navigation:amazon"/>
							</c:when>
							<c:when test="${fn:containsIgnoreCase(dropdownNavItem.fieldMap.link_text, 'itunes')}">
								<c:set var="dataClickId" value="navigation:itunes"/>
							</c:when>
							<c:otherwise>
								<c:set var="dataClickId" value="navigation:shop"/>
							</c:otherwise>
						</c:choose>
						<li><a data-behavior="track-click" data-click-id="<c:out value='${dataClickId}'/>" href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:if>