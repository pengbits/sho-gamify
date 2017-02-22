	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/video_collection/index.mobile.jsp
	@type			page
	@author			dpaul	
	@modified		Thu Aug 23 16:13:26 EDT 2012
	@note			series video collection driven by spring config VideoCollectionConfig
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="modules.tune_in_block">
		<tiles:putAttribute name="tunein_text" value="${data.tuneIn}" />
	</tiles:insertDefinition>
	
	<tiles:insertDefinition name="modules.carousel.single"/>
		
	<c:forEach items="${data.videoCollection.seasonVideoList}" var="seasonVideoList">
		<tiles:insertTemplate template="/video/views/series/_section.mobile.jsp">
			<tiles:putAttribute name="is_nested" value="false" />
			<tiles:putAttribute name="section_items" value="${seasonVideoList.videoList}" />
			<tiles:putAttribute name="section_title" value="${seasonVideoList.title}" />
		</tiles:insertTemplate>
	</c:forEach>
	