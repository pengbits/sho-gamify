	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			_about.mobile.jsp
	@type			tile
	@author			dpaul
	@modified		Thu Sep 20 15:21:57 EDT 2012
	@note			# for launch, about the series is always drawn in the homepage instead of in the news
	--------------------------------------------------------------------------------
	--%>
	<c:if test="${!empty data.series.longDescription}">
		<tiles:insertDefinition name="modules.section_header.gradient">
			<tiles:putAttribute name="title" value="About the Series" />
		</tiles:insertDefinition>
	
		<div class="block">
			<p>${data.series.longDescription}</p>
		</div>
	</c:if>