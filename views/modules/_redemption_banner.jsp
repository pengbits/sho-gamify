	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_redemption_banner.jsp
	@type			tile
	@author			dpaul
	@modified		09.22.14
	@desc			# headline copy for redemption page
	-----------------------------------------------------------------------------
	--%>
	<c:set var="store_url">http://store.sho.com?<c:if 
		test="${!empty customValueMap['storeView']}">v=${customValueMap['storeView']}&</c:if><c:choose><c:when 
		test="${!empty customValueMap['storeRedemptionTracking']}">ecid=${customValueMap['storeRedemptionTracking']}&pa=${customValueMap['storeRedemptionTracking']}</c:when>
		<c:otherwise>ecid=PRF-SHO-S02272&pa=PRF-SHO-S02272</c:otherwise></c:choose></c:set>
	
	<div class="redemption-banner">	
		<h1>Redeem Rewards</h1>
		<p>Use your available points for these rewards! If you don't have enough points yet, check out the <a href="${store_url}">Showtime Store</a>, where many of these items are for sale. Some rewards may have limited availability.</p>
	</div>
	
