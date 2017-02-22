	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		episodes
	@file			views/_assets-css.jsp
	@type			partial
	@author			ncavanagh	
	@desc			imports global series and series specific css stack
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="assets.css_tag">
		<tiles:putAttribute name="path" value="/series/lib/css/series" /></tiles:insertDefinition>