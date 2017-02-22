	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			_news.mobile.jsp
	@type			tile
	@author			dpaul
	@modified		Thu Aug 23 13:58:52 EDT 2012
	@note			# in the news module for mobile site. provides an outer container with a 
	@note			# data-attribute containing the relevant delicious/tumbler tag, but the
	@note			# javascript layer provides actual news content
	--------------------------------------------------------------------------------
	--%>
	<div class="news-feed" data-news-tag="${data.socializePromoFields.deliciousTag}">
		<div class="news-feed-inner">
			<p style="padding:15px; background-color:purple;">in the news content (ajax load of tumbler/delicious) goes here...</p>
		</div>
	</div>