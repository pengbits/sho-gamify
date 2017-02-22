	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		store
	@file			lib/views/modules/_in_the_store.jsp
	@type			partial
	@modified		10.23.12
	@author			ncavanagh	
	-----------------------------------------------------------------------------%>
	<tiles:useAttribute name="theme" 		ignore="true" />
	<tiles:useAttribute name="context" 		ignore="true" />
	<tiles:useAttribute name="classname"	ignore="true" />
	<c:set var="classname"					value="${!empty classname ? classname : 'mod-body'}" /> 
	<c:set var="classname"					value="${classname == 'none' ? '' : classname}" />
		
	<tiles:useAttribute name="view" 		ignore="true" />
	<tiles:useAttribute name="tracking" 	ignore="true" />
	
	<c:if test="${!empty context}">
		<c:if test="${context == 'extras' && !empty customValueMap['storeExtrasTracking']}">
			<c:set var="tracking" value="${customValueMap['storeExtrasTracking']}"/>
		</c:if>
		<c:if test="${context == 'episode' && !empty customValueMap['storeEpisodeGuideTracking']}">
			<c:set var="tracking" value="${customValueMap['storeEpisodeGuideTracking']}"/>
		</c:if>
	</c:if>
	
	<c:set var="component_klass" value="${platform == 'mobile' ? 'sho.ui.mobile.InTheStore' : 'sho.ui.InTheStore'}" />
	<div id="in-the-store"
		data-component="${component_klass}" 
		class="in-the-store ${classname}${' '}${theme}"  
		data-store-view="${view}" 
		data-store-tracking="${tracking}" 
		data-store-theme="${theme}">
	</div>
	<!-- END series.in_the_store -->