	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series social links 
	@file			series/lib/views/_social_sharing.jsp
	@type			partial
	@author			ncavanagh	
	@desc			for liking/tweeting/g+ing pages
	@note			jsp include parameters passes in url, checks for absolute/relative path
	--------------------------------------------------------------------------------
	--%>
	<c:set var='shareUrl' value='<%= request.getParameter("url") %>' />
	<c:if test="${fn:substring(shareUrl, 0, 4) != 'http'}">
		<c:set var='shareUrl' value='http://www.sho.com${shareUrl}' />
	</c:if>
	<div class="social-sharing clearfix">
		<div class="fb-share share first">
			<div class="fb-like" data-href="${shareUrl}" data-send="false" data-layout="button_count" data-show-faces="true" data-font="arial"></div>
		</div>
		<div class="twitter-share share" style="padding-top:0px">
			<a data-url="${shareUrl}" data-text="<%= request.getParameter("headline") %>" href="http://twitter.com/share" class="twitter-share-button" data-count="none">Tweet</a>
		</div>
		<div class="plusone-share share">
			<g:plusone href="${shareUrl}" annotation="none" size="medium"></g:plusone>
		</div>
	</div>