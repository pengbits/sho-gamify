	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/meta/index.jsp
	@type			page
	@author			ncavanagh
	@modified		08/05/14
	@desc			currently hard-coded list of series meta page links, for GSA discovery
	--------------------------------------------------------------------------------
	--%>

    <c:set var="series_meta_links" value="
        /sho/ray-donovan/meta,
        /sho/masters-of-sex/meta,
        /sho/7-deadly-sins/meta,
        /sho/60-minutes-sports/meta,
        /sho/the-affair/meta,
        /sho/all-access/meta,
        /sho/the-borgias/meta,
        /sho/californication/meta,
        /sho/dexter/meta,
        /sho/episodes/meta,
        /sho/gigolos/meta,
        /sho/homeland/meta,
        /sho/house-of-lies/meta,
        /sho/inside-comedy/meta,
        /sho/inside-the-nfl/meta,
        /sho/jim-rome-on-showtime/meta,
        /sho/the-l-word/meta,
        /sho/nurse-jackie/meta,
        /sho/oliver-stones-untold-history-of-the-united-states/meta,
        /sho/penny-dreadful/meta,
        /sho/polyamory-married-and-dating/meta,
        /sho/queer-as-folk/meta,
        /sho/the-real-l-word/meta,
        /sho/secret-diary-of-a-call-girl/meta,
        /sho/shameless/meta,
        /sho/time-of-death/meta,
        /sho/the-tudors/meta,
        /sho/web-therapy/meta,
        /sho/years-of-living-dangerously/meta
    " />
    <ul>
	<c:forTokens items="${series_meta_links}" delims="," var="s" varStatus="i">
         <li><a href="${s}">${s}</a></li>
	</c:forTokens>
    </ul>