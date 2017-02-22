	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series tv rating/legal footer
	@file			series/lib/views/_footer.jsp
	@type			partial
	@author			ncavanagh
	@desc			elements passed in through series-specific custom value map in spring-config	
	--------------------------------------------------------------------------------
	--%>
	<div class="series-footer">
		<p class="rating-advisories">
			<c:if test="${!empty customValueMap['tvRating']}"><span class="tv-rating <c:out value='${customValueMap["tvRating"]}' />"><c:out value='${customValueMap["tvRating"]}' /></span></c:if>
			<c:if test="${!empty customValueMap['advisories']}"><span class="advisories"><c:out value='${customValueMap["advisories"]}' /></span></c:if></p>
			<c:if test="${!empty customValueMap['legal']}"><p class="legal"><c:out value='${customValueMap["legal"]}' /></p></c:if>
		<!--<p class="legal mobile-legal">*Message &#38; Data rates may apply and be charged to your wireless bill or be deducted from your prepaid balance. Visit your carrier for more information. Each program may include up to 3 messages per week: alerts, polls, and trivia. To unsubscribe, text <strong>STOP</strong> to 74688. For help, text <strong>HELP</strong> to 74688. Supported carriers: Alltel, AT&#38;T, Boost, Cellcom, Cellular South, Cincinnati Bell, Dobson, Nextel, nTelos, Sprint, T-Mobile, US Cellular, Verizon Wireless.</p>-->
	</div>
	<div class="clear-footer"></div>

	