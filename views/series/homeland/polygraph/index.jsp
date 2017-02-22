	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		shameless
	@file			/homeland/s1/views/polygraph/index.jsp
	@type			page
	@author			ncavanagh	
	@desc			homeland polygraph
	--------------------------------------------------------------------------------
	--%>
	<style>
	.content {
	    margin-top: 100px!important;
	}
	</style>
	<script>
	sho.dom.bind('nitro:init', function(){
		sho.accounts.nitro.getInstance().logAction({
			'tags':'special-feature_view'
		});
	});
	</script>
	
	<tiles:insertDefinition name="series.tune-in" />
    <div style="margin:60px auto 100px; position:relative; top:75px; width:950px; z-index:-100;">
        <img src="/assets/images/series/homeland/s1/images/extras/polygraph-icon.png" style="display:none;"  />
        <iframe src="http://s3.ralphandco.com/showtime_homeland/" width="950" height="561" frameborder="0" scrolling="no" >
          <p>Your browser does not support iframes.</p>
        </iframe> 
    </div>