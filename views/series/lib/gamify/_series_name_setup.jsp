	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		series
	@file			series/lib/views/gamify/_series_name_setup
	@type			partial
	@author			dpaul
	@modified		04.09.14
	@desc			# exposes the series short title to gamify components if available
	@note			# this is used for proper tracking of the challenge detail open state
	@note			# added custom_name option for passing this value in from red rewards contexts
	-----------------------------------------------------------------------------
	--%>
		
	<c:if test="${!empty data && !empty data.series}"><c:set var="series_name_short" value="${data.series.shortTitle}" scope="request" /></c:if>
	<script type="text/javascript">
		sho.provide('sho.gamify');
		sho.gamify.series_name = "${series_name_short}";		
	</script>
		