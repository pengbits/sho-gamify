	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series about module
	@file			series/lib/views/_about.jsp
	@type			partial
	@author			ncavanagh	
	@desc			
	--------------------------------------------------------------------------------
	--%>
	
	
	<c:if test="${!empty data.series.longDescription}">
		<h2>About the Series</h2>
		<p itemprop="about"><c:out value='${data.series.longDescription}'/></p>
	</c:if>
