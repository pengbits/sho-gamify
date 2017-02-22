	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			_slide_show.mobile.jsp
	@type			partial
	@author			dpaul
	@modified		Thu Sep 13 17:00:56 EDT 2012
	@note			in-page photo gallery for series episode guide
	--------------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="show" />
	
	<div class="slideshow">
		<c:set var="slideshow_image_fallback" value="/assets/images/FPO/purple.png" />
		<c:set var="slideshow_image" value="${!empty show.image ? show.image : slideshow_image_fallback}" />
		<img src="http://www.sho.com${show.image.path}" />
		<c:if test='${!empty show.imageList}'><span class="slideshow-icon"><b>.</b> ${fn:length(show.imageList)} Photos</span></c:if>
	</div>
	<!-- END slideshow -->