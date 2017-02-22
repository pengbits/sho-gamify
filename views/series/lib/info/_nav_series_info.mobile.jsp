	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/_nav-series_info.mobile.jsp
	@type			partial
	@author			dpaul	
	@desc			series generic header, no navigation
	--------------------------------------------------------------------------------
	--%>
	<div id="nav-primary" class="nav-primary nav-primary-outer">
		<b><c:out value="${data.series.displayTitle}"/><b>
	</div><!-- ./nav-secondary -->