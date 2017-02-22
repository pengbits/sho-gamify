	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series ways to watch
	@file			series/lib/views/_news.jsp
	@type			partial
	@author			ncavanagh	
	@desc			
	--------------------------------------------------------------------------------
	--%>
	<div class="mod news">
		<div class="mod-body">
			<h2>In the News</h2>
			<div class="news-feed" id="<c:out value = "${data.socializePromoFields.deliciousTag}"/>" /></div>
			<div class="news-more" style="display:none;"><span class="raquo">&raquo;</span><a class="news-modal-link">more</a></div>
		</div>
	</div>