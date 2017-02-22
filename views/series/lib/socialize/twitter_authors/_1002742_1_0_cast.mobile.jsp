	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		livefyre_dev
	@file			social_collections/_323_7_0_cast.mobile.jsp
	@type			partial
	@author			dpaul
	@modified		12.07.12
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
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_LievSchreiber_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/LievSchreiber">Liev Schreiber</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/LievSchreiber">@LievSchreiber</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_PoochHall_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/iam_POOCHHALL">Pooch Hall</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/iam_POOCHHALL">@iam_POOCHHALL</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_AustinNichols_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/AUS10NICHOLS">Austin Nichols</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/AUS10NICHOLS">@AUS10NICHOLS</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_JohnathonSchaech_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/JohnSchaech">Johnathon Schaech</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/JohnSchaech">@JohnSchaech</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_KateMoennig_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/katemoennig">Kate Moennig</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/katemoennig">@katemoennig</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_DashMihok_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/DizMihok">Dash Mihok</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/DizMihok">@DizMihok</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_EddieMarsan_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/eddiemarsan">Eddie Marsan</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/eddiemarsan">@eddiemarsan</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_KerrisDorsey_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/kerrisdorsey">Kerris Dorsey</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/kerrisdorsey">@kerrisdorsey</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_Steven_Bauer_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/thestevenbauer">Steven Bauer</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/thestevenbauer">@thestevenbauer</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_DevonBagby_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/DevonBagby">Devon Bagby</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/DevonBagby">@DevonBagby</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/raydonovan/socialize/twitter_authors/35x35/RayDonovan_S1_Socialize_Twitter_JamesWoods_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/BreakheartFilms">James Woods</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/BreakheartFilms">@BreakheartFilms</a></span></h2>
				</li>


			</ul>
		</div>
	</div><!-- END modules.disclosure-list -->

			