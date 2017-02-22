	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		gamify
	@file			gamify/views/canonical_url/show.mobile.jsp
	@type			page
	@author			dpaul	
	@desc			canonical url for a challenge.
	--------------------------------------------------------------------------------
	--%>
	
	<tiles:insertDefinition name="modules.section_header.black">
		<tiles:putAttribute name="title" value="Redirecting to Challenge..." />
		<tiles:putAttribute name="fontCase" value="title-case" />
	</tiles:insertDefinition>
	
	<p style="height:250px">&nbsp;</p>
	<script type="text/javascript">
		<c:set var="challengeUrl" value="/sho/dexter/red-rewards/challenges" />
	<c:if test="${!empty data && !empty data.challenge && !empty data.challenge.name}">
		<c:set var="challengeUrl" value="${data.homeBaseUrl}" />
	</c:if>
	window.location = '${challengeUrl}'
	</script>