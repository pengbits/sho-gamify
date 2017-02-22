	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--  

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		global
	@file			series/lib/views/_nav-series_info.jsp
	@type			partial
	@author			ncavanagh	
	@desc			series generic header, no navigation
	@note			# now drawing a link back to homepage if this is a different page such as purchase page
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series_display_title" value="${data.series.displayTitle}" />
	
	<div id="nav-secondary" class="nav docked nav-secondary">
		<span class="series-title">
			<c:choose><c:when test="${empty data.pageType || data.pageType != 'home'}">
				<a href="${data.series.baseUrl}/home">
					${series_display_title}
				</a></c:when><c:otherwise>
					${series_display_title}
				</c:otherwise>
			</c:choose>
		</span>
	</div><!-- END nav-secondary -->