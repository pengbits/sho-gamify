	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/_apps.jsp
	@type			partial
	@author			ncavanagh	
	@desc			from global series apps PCE feed
	--------------------------------------------------------------------------------
	--%>
	<c:set var="appsPromotions" value="${data.appsPromotions}"/>
	<div class="mod-body apps">
		<h2>Apps</h2>
		<ul>
			<c:forEach items="${appsPromotions}" var="app" varStatus="status">
			<li class="clearfix<c:if test='${status.last}'> last</c:if>">
				<div class="promo-img"><a href="<c:out value='${app.fieldMap["link"]}' />"><img alt="<c:out value='${app.fieldMap["headline"]}' />" src="<c:out value='${app.fieldMap["image_url"]}' />"></a></div>
				<p class="copy"><a href="<c:out value='${app.fieldMap["link"]}' />"><c:out value='${app.fieldMap["headline"]}' /></a><c:out value='${app.fieldMap["copy_block"]}' /></p>
				<p class="app-download"><span class="raquo">&raquo;</span><a href="<c:out value='${app.fieldMap["link"]}' />">download now</a></p>
				<c:if test="${not empty app.fieldMap['qr_code_image']}">
					<p class="app-download"><span class="raquo">&raquo;</span><a href="#" class="toggle-visible" rel="androidQR-<c:out value='${status.count}' />">reveal qr code</a>
					<p class="androidQR" id="androidQR-<c:out value='${status.count}' />" style="display:none;">
						<img src="<c:out value='${app.fieldMap["qr_code_image"]}' />" alt="QR Code" title="QR Code"/>
					</p>
				</c:if>	
			</li>
			</c:forEach>
		</ul>
	</div>
