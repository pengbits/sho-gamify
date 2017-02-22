	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/nav/drop_downs/_apps_and_extras.jsp
	@type			partial
	@author			ncavanagh	
	@desc			apps and extras dropdown on series site nav
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="navigationPromotion" value="${data.navigation.navigationPromotion}"/>
	<c:set var="appDropdownNavList" value="${data.navigation.appDropdownNavList}"/>

	<!-- apps & extras dropdown -->
	<c:if test="${!empty appDropdownNavList}">
		<div id="nav-content-extras" class="nav-content x3">
			<tiles:insertTemplate template="./_promotional_nav_item.jsp">
				<tiles:putAttribute name="promo_key" value="extras" />
			</tiles:insertTemplate>
			<div class="nav-col callout stroke-right">
				<ul>
				    <li><a href="${series.baseUrl}/extras">All Apps &amp Extras</a></li>
					<c:forEach items="${appDropdownNavList}" var="dropdownNavItem" begin="0" end="3">
						<li><a href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
					</c:forEach>
				</ul>
			</div>			
			<div class="nav-col">
				<ul>
					<c:forEach items="${appDropdownNavList}" var="dropdownNavItem" begin="4" end="8">
						<li><a href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="nav-col">
				<ul>
					<c:forEach items="${appDropdownNavList}" var="dropdownNavItem" begin="9" end="14">
						<li><a href="<c:out value='${dropdownNavItem.fieldMap.link}'/>"><c:out value="${dropdownNavItem.fieldMap.link_text}"/></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:if>