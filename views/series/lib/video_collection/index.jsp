	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series video
	@file			series/lib/views/video_collection/index.jsp
	@type			page
	@author			ncavanagh	
	@modified		04.25.14
	@desc			# series video collection driven by spring config VideoCollectionConfig
	@note			# passing 'null' as a string in the configuration hides the group header text (preserving empty space, however)
	@note			# which otherwise defaults to "Season (X)" in the Java layer
	@note			# refactored to use media_galleri component
	----------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="series.tune-in.docked" /> 
	<c:if test="${!empty data.headerPromotion}">
		<tiles:insertDefinition name="series.header-promotion" />
	</c:if>	
	
	<c:forEach var="season" items="${data.videoCollection.seasonVideoList}">		
		<tiles:insertDefinition name="video_section">
			<tiles:putAttribute name="videos" 			value="${season.videoList}" />
			<tiles:putAttribute name="sectionTitle" 	value="${season.title}" />
			<%-- `no need for pagination in webisodes pages, so disble header and footer to reduce margin under the carousel promo` --%>
			<tiles:putAttribute name="include_head"		value="false" />
			<tiles:putAttribute name="include_footer"	value="false" />
		</tiles:insertDefinition>
	</c:forEach>

	