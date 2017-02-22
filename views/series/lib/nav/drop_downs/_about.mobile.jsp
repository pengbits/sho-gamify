	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/nav/drop_downs/_nav_about.jsp
	@type			partial
	@author			dpaul	
	@desc			about drop-down on series site nav
	# - promotional link 
	# - pce-driven links (about the series, custom cast pages) come first
	# for...each characterNavList { href='url', label='name' }
	--------------------------------------------------------------------------------
	--%>
	<div id="nav-menu-about" class="nav-menu group">
		<ul>
			<tiles:insertTemplate template="./_promotional_nav_item.mobile.jsp">
				<tiles:putAttribute name="promo_key" value="about" />
				<tiles:putAttribute name="promo_label" value="link_copy" />
			</tiles:insertTemplate>
			
			<c:forEach items="${data.navigation.aboutDropdownNavList}" var="aboutDropdownNavItem">
				<li><a href="<c:out value='${aboutDropdownNavItem.fieldMap.link}'/>"><c:out value="${aboutDropdownNavItem.fieldMap.link_text}"/></a></li>
			</c:forEach>
		
			<c:forEach items="${data.navigation.characterNavList}" var="characterNav">
				<li><a href="<c:out value='${characterNav.url}'/>"><c:out value="${characterNav.name}"/></a></li>
			</c:forEach>
		</ul>
	</div><!-- ./about -->