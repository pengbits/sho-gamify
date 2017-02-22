	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		socialize
	@file			_fan_pages.jsp
	@type			tile
	@author			dpaul
	@modified		11.30.12
	@note			# fan-pages module for use in socialize page
	-----------------------------------------------------------------------------
	--%>
	<tiles:importAttribute name="hero_img" ignore="true" />
	<div class="module fan-pages">
		<h2>Connect with Us</h2>
		<p>Expand your experience and socialize with other fans</p>
		<c:if test="${!empty hero_img}"><img src="${hero_img}" /></c:if>
		<c:forEach items="${data.socialLinkMap}" var="socialLink">
			<h4>
				<a href="${socialLink.value.socialURL}">
					<span class="raquo">&raquo;</span>${socialLink.value.displayTitle}
				</a>
			</h4>
		</c:forEach>
	</div><!-- END module.fan-pages -->

	