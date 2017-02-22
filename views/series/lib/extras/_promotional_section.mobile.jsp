	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/extras/_promotional_section.jsp
	@type			page
	@author			dpaul	
	@desc			combines a section header with a secondary promotion list.
	@desc			assumes	that the given section will map to a collection of promotional items, ie
	@desc			'extras' => '${data.extrasPromotionalItems}'
	--------------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="section" />
	<c:set var="items_key" value="${section}Promotions" />
	<c:set var="items" value="${data[items_key]}" />
	<c:set var="title">${fn:toUpperCase(fn:substring(section, 0, 1))}${fn:substring(section, 1, -1)}</c:set>
	
	<c:if test="${fn:length(items) > 0}">
		<tiles:insertDefinition name="modules.section_header.black">
			<tiles:putAttribute name="title" value="${title}" />
		</tiles:insertDefinition>
		
		<tiles:insertDefinition name="modules.secondary_promos">
			<tiles:putAttribute name="theme" value="thumb-copy" />
			<tiles:putAttribute name="items" value="${items}" />
		</tiles:insertDefinition>
	</c:if>
	
	<!-- END ${section}.secondary_promos -->