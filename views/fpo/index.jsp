	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			index.jsp
	@type			page
	@author			dpaul
	@modified		Mon Apr 15 11:58:01 EDT 2013
	@desc			set up design in a browser context for easy comparison
	@note			notes
	-----------------------------------------------------------------------------
	--%>
	
	<div id="gamify-container" class="include-fpo fpo-paginated"><!-- include-fpo, include-spec, '', challenge-details-tests is trigger for js helper -->
		<div class="challenge-details-wrapper">
			<div class="challenge-expanded-state-dummy">
			</div>
		</div>
	</div>
	

	<script type="text/javascript">!function($){
	sho.dom.ready(function(){
		$('#gamify-container').on('click', function(e){
			$(this).toggleClass('include-fpo').toggleClass('include-spec');
		})
	})
	}(sho.$)</script>
	