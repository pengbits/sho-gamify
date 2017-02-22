	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/nav/drop_downs/_nav_about.jsp
	@type			partial
	@author			ncavanagh	
	@desc			about dropdown on series site nav
	--------------------------------------------------------------------------------
	--%>
	<c:set var="navigationPromotion" value="${data.navigation.navigationPromotion}"/>
	<c:set var="characterNavList" value="${data.navigation.characterNavList}"/>
	<c:set var="aboutDropdownNavList" value="${data.navigation.aboutDropdownNavList}"/>
	
	<c:set var="aboutNavLength" value="${fn:length(aboutDropdownNavList)}"/>
	<c:set var="characterNavLength" value="${fn:length(characterNavList)}"/>
	<%-- set number of rows per column--%>
	<c:set var="rowLength" value="5"/>
	<%-- limit number of characters in first column, based on the number of pce-driven links before it--%>
	<c:set var="firstColumnCharacterRowLength" value="${rowLength - aboutNavLength}"/>

	<c:set var="addend" value="4"/>
	<%-- set max number of columns--%>
	<c:set var="columns" value="5"/>

	<!-- about dropdown -->
	<div id="nav-content-about" class="nav-content x4">
		<tiles:insertTemplate template="./_promotional_nav_item.jsp">
			<tiles:putAttribute name="promo_key" value="about" />
		</tiles:insertTemplate>
		<div class="nav-col callout stroke-right">
			<ul>
			    <c:forEach items="${aboutDropdownNavList}" var="aboutDropdownNavItem">
					<li><a href="<c:out value='${aboutDropdownNavItem.fieldMap.link}'/>"><c:out value="${aboutDropdownNavItem.fieldMap.link_text}"/></a></li>
				</c:forEach>
				<c:forEach items="${characterNavList}" var="characterNav" begin="0" end="${firstColumnCharacterRowLength - 1}">
					<li><a href="<c:out value='${characterNav.url}'/>"><c:out value="${characterNav.name}"/></a></li>
				</c:forEach>
			</ul>
			<c:set var="start" value="${firstColumnCharacterRowLength}"/>
		</div>
			<c:forEach var="i" begin="1" end="${columns - 1}" step="1" varStatus ="status">
				<c:if test="${start > 0 && characterNavLength >= start}">
					<div class="nav-col">
						<ul>
							<c:forEach items="${characterNavList}" var="characterNav" begin="${start}" end="${start + addend}">
								<li><a href="<c:out value='${characterNav.url}'/>"><c:out value="${characterNav.name}"/></a></li>
							</c:forEach>
						</ul>
					</div>
					<c:set var="start" value="${start + addend + 1}"/>
				</c:if>
			</c:forEach>
	</div>