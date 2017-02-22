	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		homeland
	@file			homeland/views/_assets-css.jsp
	@type			partial
	@author			ncavanagh	
	@desc			imports global and series-specific css
	@note			gamify css moved to series lib
	--------------------------------------------------------------------------------
	--%>	
	<tiles:insertDefinition name="assets.css_tag">
	    <tiles:putAttribute name="path" value="/series/lib/css/series" />
	</tiles:insertDefinition>