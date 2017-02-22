<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

JSP
--------------------------------------------------------------------------------
@site			sho.com <mobile>
@project		livefyre_dev
@file			social_collections/_1002762_1_0_cast.mobile.jsp
@type			partial
@author			mlamoureaux
@modified		08.14.13
@note			# contains list of talent tweeters for cast module in socialize page
@note			# currently, only ways-to-watch has the toggle behavior,
@note			# while the more generic 'disclosure list' is static. we should change this
@note			# so that we don't have to use the ways-to-watch classnames here
-----------------------------------------------------------------------------
--%>
<div class="disclosure-list theme-twitter toggleable" data-component="sho.ui.mobile.DisclosureList">
	<div class="disclosure-list-header header-closed">
		<h1>Follow the Leads <canvas class="icon-canvas icon-down"></canvas></h1>
	</div>
	<div class="disclosure-list-menu">
		<ul>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/michaelsheen_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/michaelsheen">Michael Sheen</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/michaelsheen">@michaelsheen</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/nicholasdagosto_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/nicholasdagosto">Nicholas D'Agosto</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/nicholasdagosto">@nicholasdagosto</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/teddysears_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/teddysears">Teddy Sears</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/teddysears">@teddysears</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/wendimclendonco_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/wendimclendonco">Wendi McLendon-Covey</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/wendimclendonco">@wendimclendonco</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/CaitlinFitzG_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/CaitlinFitzG">Caitlin Fitzgerald</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/CaitlinFitzG">@CaitlinFitzG</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/BeauBridges1_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/MrBeauBridges">Beau Bridges</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/MrBeauBridges">@MrBeauBridges</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/allisonbjanney_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/allisonbjanney">Allison Janney</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/allisonbjanney">@allisonbjanney</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/analeighashford_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/TheAAshford">Annaleigh Ashford</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/TheAAshford">@TheAAshford</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/courtneybvance_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/CourtneyBVance">Courtney B. Vance</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/CourtneyBVance">@CourtneyBVance</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/helenayorke_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/HeleneYorke">Hel&eacute;ne Yorke</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/HeleneYorke">@HeleneYorke</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/kekepalmer_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/KekePalmer">Keke Palmer</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/KekePalmer">@KekePalmer</a></span></h2>
			</li>
			<li><h2>
				<span class="twitter-avatar"><img src="/assets/images/series/mastersofsex/socialize/twitter_authors/35x35/sarahsilverman_35x35.jpg" width="48" height="48" /></span>
				<span class="twitter-author-name"><a href="http://twitter.com/SarahKSilverman">Sarah Silverman</a></span>
				<span class="twitter-author-handle"><a href="http://twitter.com/SarahKSilverman">@SarahKSilverman</a></span></h2>
			</li>
			
		</ul>
	</div>
</div><!-- END -->

