	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/extras/index.mobile.jsp
	@type			page
	@author			dpaul	
	@desc			apps-and-extras template page
	@note			all extras pages get an In The Store module, default store view if needed
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="modules.tune_in_block">
		<tiles:putAttribute name="tunein_text" value="${data.tuneIn}" />
	</tiles:insertDefinition>
	
	<tiles:insertDefinition name="modules.carousel.single"/>
	
	<c:forTokens items="apps,extras" delims="," var="section">
		<tiles:insertTemplate template="./_promotional_section.mobile.jsp">
			<tiles:putAttribute name="section" value="${section}" />
		</tiles:insertTemplate>
	</c:forTokens>
	
	<c:set var="storeView" value="${!empty customValueMap['storeView'] ? customValueMap['storeView'] : 'showtime_dvds'}" />
	<tiles:insertDefinition name="series.in-the-store.default">
		<tiles:putAttribute name="view" value="${storeView}" />
		<tiles:putAttribute name="context" value="extras" />
	</tiles:insertDefinition>

	<tiles:insertTemplate template="./_promotional_section.mobile.jsp">
		<tiles:putAttribute name="section" value="games" />
	</tiles:insertTemplate>
