	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			views/episode_guide/index.mobile.jsp
	@type			page
	@author			dpaul
	@modified		Fri Aug 24 16:08:51 EDT 2012
	@desc			landing page for episode guide "/season" action - logic determines page content
	--------------------------------------------------------------------------------
	--%>
	<c:if test='${data.pageType == "season"}'>
		<tiles:insertDefinition name="series.season.mobile" />
	</c:if>  
	<c:if test='${data.pageType == "episode"}'>
		<tiles:insertDefinition name="series.episode.mobile" />
	</c:if>

