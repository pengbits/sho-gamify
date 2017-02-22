	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/_extras.jsp
	@type			partial
	@author			ncavanagh	
	@desc			PCE
	--------------------------------------------------------------------------------
	--%>
	<c:set var="extrasPromotions" value="${data.extrasPromotions}"/>
	<c:if test='${!empty extrasPromotions}'>
		<div class="mod-body">
			<h2>Extras</h2>
			<ul>
				<c:forEach items="${extrasPromotions}" var="extra">
				<li class="clearfix">
					<div class="promo-img">
						<c:if test="${extra.fieldMap['link'] == null}">
							<img alt="<c:out value='${extra.fieldMap["headline"]}' />" src="<c:out value='${extra.fieldMap["image_url"]}' />">
							<p><span class="headline"><c:out value='${extra.fieldMap["headline"]}' /></span><c:out value='${extra.fieldMap["copy_block"]}' /></p>
						</c:if>
						<c:if test="${extra.fieldMap['link'] != null}">
							<c:set var="url" value="${extra.fieldMap['link']}" />
							<c:choose>
								<c:when test="${extra.fieldMap['promo_type'] == 'video'}"> 
									<c:set var="urlAttributes" value="data-behavior='play-video' data-video-id='${url}' 					href='/sho/video/titles/${url}/untitled'" />
								</c:when>
								<c:otherwise>
									<c:set var="urlAttributes" value="href='${url}'" />
								</c:otherwise>
							</c:choose>
							<a ${urlAttributes}><img alt="<c:out value='${extra.fieldMap["headline"]}' />" src="<c:out value='${extra.fieldMap["image_url"]}' />"></a>
							<p><a ${urlAttributes}><c:out value='${extra.fieldMap["headline"]}' /></a>
							<c:out value='${extra.fieldMap["copy_block"]}' /></p>
						</c:if>
					</div>
					<p class="cta">
						<c:forEach var="i" begin="1" end="4" step="1" varStatus ="status">
							<c:set var="ctaLink" value="${i} cta link" />
							<c:set var="ctaPromoType" value="${i} cta promo_type" />
							<c:set var="ctaCopy" value="${i} cta copy" />
							<c:if test="${!empty extra.fieldMap[ctaLink]}">
								<c:if test="${!status.first}"><span class="divider">|</span></c:if>
								<c:set var="url" value="${extra.fieldMap[ctaLink]}" />
								<c:choose>
									<c:when test="${extra.fieldMap[ctaPromoType] == 'video'}"> 
										<c:set var="urlAttributes" value="data-behavior='play-video' data-video-id='${url}' 					href='/sho/video/titles/${url}/untitled'" />
									</c:when>
									<c:otherwise>
										<c:set var="urlAttributes" value="href='${url}'" />
									</c:otherwise>
								</c:choose>
								<a ${urlAttributes}><c:out value='${extra.fieldMap[ctaCopy]}' /></a>
							</c:if>
						</c:forEach>
					</p>
				</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>