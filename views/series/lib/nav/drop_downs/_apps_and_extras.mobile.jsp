	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 
	
	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		_
	@file			series/lib/views/nav/drop_downs/_apps_and_extras.jsp
	@type			partial
	@author			dpaul	
	@desc			apps and extras drop-down on series site nav
	
	# - promo item
	# - static all apps-and-extras item
	# for...each appDropdownNavList { href='link', label='link_text' }
	--------------------------------------------------------------------------------
	--%>
	<div id="nav-menu-apps-and-extras" class="nav-menu group">
		<ul>
			<tiles:insertTemplate template="./_promotional_nav_item.mobile.jsp">
				<tiles:putAttribute name="promo_key" value="extras" />
				<tiles:putAttribute name="promo_label" value="link_copy" />
			</tiles:insertTemplate>
			
			<li><a href="${data.series.baseUrl}/extras">All Apps and Extras</a></li>
			<c:forEach items="${data.navigation.appDropdownNavList}" var="item">
				<li><a href="<c:out value='${item.fieldMap.link}'/>"><c:out value="${item.fieldMap.link_text}"/></a></li>
			</c:forEach>
		</ul>
	</div>