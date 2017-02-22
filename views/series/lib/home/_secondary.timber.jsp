	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/home/_secondary.jsp
	@type			partial
	@author			ncavanagh	
	@author			dpaul
	@modfied		01.27.15
	@desc			# secondary content in home/landing pages
	@todo			# move email signup module setup to filter.jsp so it can be shared
	--------------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="email_signup"	ignore="true" /><c:if test="${!empty email_signup and email_signup != 'false'}">	
		<c:set var="email_signup_module">
			<div class ="email_signup_module-wrapper">
				<tiles:insertDefinition name="modules.accounts.email_signup_widget">
					<tiles:putAttribute name="pub_id" 		value="${customValueMap['newsletter_id']}" />		
					<tiles:putAttribute name="pub_title" 	value="${customValueMap['newsletter_title']}" />
				</tiles:insertDefinition>
			</div>
		</c:set>
	</c:if>
	
	<div class="timber-container-fluid">
	<div class="secondary secondary-dark row">
		
		<div class="col-sm-3">
			<div class="ways-to-watch">
				<h2>Ways To Watch</h2>
				<ul>
					<li class="watch-on-tv"><a data-behavior="track-click" data-click-id="ways_to_watch:on_tv" href="/sho/shameless/season/5">On TV</a></li>
					<li class="watch-on-demand"><a data-behavior="track-click" data-click-id="ways_to_watch:on_demand" href="/sho/schedules/ondemand/series#/series/408/shameless">On Demand</a></li>
					<li><a data-behavior="track-click" data-click-id="ways_to_watch:showtime_anytime" href="/sho/showtime-anytime">Showtime Anytime</a></li>
					<li class="order-now"><a data-click-id="ways_to_watch:link_order" href="/sho/order/home" data-behavior="track-click">Order Now</a></li>
				</ul>
				<ul class="ways-to-own">
					<li class="own-this-series">Own this series:</li>
					<li><a data-behavior="track-click" data-click-id="ways_to_watch:itunes" href="https://itunes.apple.com/us/tv-season/shameless-season-4/id900241065?uo=4&amp;at=10lwtv&amp;ct=shame4">iTunes</a></li>	
					<li><a data-behavior="track-click" data-click-id="ways_to_watch:amazon" href="http://amzn.com/B00MEAKNQK  ">Amazon Instant Video</a></li>
					<li><a data-behavior="track-click" data-click-id="ways_to_watch:vudu" href="http://www.vudu.com/movies/#!content/560305/Shameless-Season-4">VUDU</a></li>
					<li><a data-behavior="track-click" data-click-id="ways_to_watch:google play" href="https://play.google.com/store/tv/show/Shameless?id=qG7sOWnFs0c&amp;hl=en">Google Play</a></li>
					<li><a data-behavior="track-click" data-click-id="ways_to_watch:shop" href="http://store.sho.com/shameless-season-4-dvd/detail.php?p=702760&amp;v=showtime_shows_shameless_dvds">DVD</a></li>		
				</ul>
			</div>
		

				<div class="email-signup-widget" 
					data-component="sho.accounts.email.SignUpWidget" 
					data-defer="user:loaded" 
					data-pub-id="319" 
					data-pub-title="Shameless"
				>
				</div>

		
		</div><!-- END col-sm-3 -->
		
		<div class="col-sm-6">
			<div class="row">
				<div class="col-md-6">

					<div class="media media--promo">
						<a class="media__img" href="34031">
							<img src="http://www.sho.com/site/image-bin/images/408_5_3410405/408_5_3410405_ful02_144x81.jpg" alt="Watch the New Season Premiere">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="34031" class="copy-two-tier__t1">Watch the New Season Premiere</a>
							<div class="copy-two-tier__t2">Watch the Season 5 premiere for free now. </div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://www.showtimeanytime.com/#/series/408">
							<img src="http://www.sho.com/site/image-bin/images/408_3_3361704/408_3_3361704_07_144x81.jpg" alt="Catch Up on Shameless on Showtime Anytime">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://www.showtimeanytime.com/#/series/408" class="copy-two-tier__t1">Catch Up on Shameless on Showtime Anytime</a>
							<div class="copy-two-tier__t2">Watch Shameless on your computer, tablet, mobile devices and stream to your TV - FREE with your SHOWTIME® subscription through participating TV providers.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://store.sho.com/shop-vday-sale/index.php?v=showtime_promo&amp;ecid=PRF-SHO-S02323&amp;pa=PRF-SHO-S02323">
							<img src="http://www.sho.com/site/image-bin/images/323_6_0/323_6_0_prm-vday_144x81.jpg" alt="Valentine's Day Deals">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://store.sho.com/shop-vday-sale/index.php?v=showtime_promo&amp;ecid=PRF-SHO-S02323&amp;pa=PRF-SHO-S02323" class="copy-two-tier__t1">Valentine's Day Deals</a>
							<div class="copy-two-tier__t2">Shop Valentine's Day deals on gear from your favorite series at the SHO Store.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="33818">
							<img src="http://www.sho.com/site/image-bin/images/408_5_0/408_5_0_bsc02_144x81.jpg" alt="Behind The Scenes">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="33818" class="copy-two-tier__t1">Behind The Scenes</a>
							<div class="copy-two-tier__t2">Watch the cast discuss returning for Season 5.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://www.sagawards.org/awards/nominees-and-recipients/21st-annual-screen-actors-guild-awards">
							<img src="http://www.sho.com/site/image-bin/images/408_5_0/408_5_0_pro08_144x81.jpg" alt="SAG Award Winner">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://www.sagawards.org/awards/nominees-and-recipients/21st-annual-screen-actors-guild-awards" class="copy-two-tier__t1">SAG Award Winner</a>
							<div class="copy-two-tier__t2">Congratulations to William H. Macy on his SAG Award for Outstanding Performance by a Male Actor in a Comedy Series.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="33957">
							<img src="http://www.sho.com/site/image-bin/images/408_5_0/408_5_0_pro03_144x81.jpg" alt="Emmy Rossum on Fiona Gallagher">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="33957" class="copy-two-tier__t1">Emmy Rossum on Fiona Gallagher</a>
							<div class="copy-two-tier__t2">Go behind the scenes with Emmy Rossum, who discusses Fiona's story line for season 5. </div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://showtimeallaccess.tumblr.com/post/107927993197/showtime-comedy-shameless-gets-sixth-season">
							<img src="http://www.sho.com/site/image-bin/images/408_5_3410405/408_5_3410405_05_144x81.jpg" alt="Shameless Renewed for Season 6">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://showtimeallaccess.tumblr.com/post/107927993197/showtime-comedy-shameless-gets-sixth-season" class="copy-two-tier__t1">Shameless Renewed for Season 6</a>
							<div class="copy-two-tier__t2">Hot off its season 5 premiere, SHOWTIME has ordered a 6th season of Shameless.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/shameless/season/5/episode/5#/index">
							<img src="http://www.sho.com/site/image-bin/images/408_5_3410406/408_5_3410406_02_144x81.jpg" alt="Episode Recaps">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/shameless/season/5/episode/5#/index" class="copy-two-tier__t1">Episode Recaps</a>
							<div class="copy-two-tier__t2">Read what the critics are saying about Shameless this season. </div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="34070">
							<img src="http://www.sho.com/site/image-bin/images/408_5_0/408_5_0_pro09_144x81.jpg" alt="Shameless in 2 Minutes">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="34070" class="copy-two-tier__t1">Shameless in 2 Minutes</a>
							<div class="copy-two-tier__t2">Catch up on last 4 seasons of the series.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="33726">
							<img src="http://www.sho.com/site/image-bin/images/408_5_0/408_5_0_bsc01_144x81.jpg" alt="Season 5 First Takes">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="33726" class="copy-two-tier__t1">Season 5 First Takes</a>
							<div class="copy-two-tier__t2">Go behind the scenes at the photo shoot for Season 5.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/shameless/season/5/episode/5#/index">
							<img src="http://www.sho.com/site/image-bin/images/408_5_3410406/408_5_3410406_09_144x81.jpg" alt="Shameless Music">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/shameless/season/5/episode/5#/index" class="copy-two-tier__t1">Shameless Music</a>
							<div class="copy-two-tier__t2">Check out the music from each episode of Shameless.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="34139">
							<img src="http://www.sho.com/site/image-bin/images/408_5_0/408_5_0_bsc03_144x81.jpg" alt="The Casts Talks Gallavich">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="34139" class="copy-two-tier__t1">The Casts Talks Gallavich</a>
							<div class="copy-two-tier__t2">Watch the Shameless cast discuss Ian and Mickey's relationship and how the Gallavich bond has changed over the years.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="https://www.facebook.com/ShamelessOnShowtime/posts/838399459551794">
							<img src="http://www.sho.com/site/image-bin/images/408_2_139860/408_2_139860_02_144x81.jpg" alt="Emmy Rossum Facebook Q&amp;A">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="https://www.facebook.com/ShamelessOnShowtime/posts/838399459551794" class="copy-two-tier__t1">Emmy Rossum Facebook Q&amp;A</a>
							<div class="copy-two-tier__t2">Read Emmy Rossum's answers from her fan Q&amp;A on Facebook.</div>
							</div>
						</div>
					</div>	

			</div><!-- END inner col-md-6 -->

			<div class="col-md-6">

					<div class="media media--promo">
						<a class="media__img" href="/sho/accounts/newsletter/subscription/319">
							<img src="http://www.sho.com/site/image-bin/images/408_4_0/408_4_0_pro03_144x81.jpg" alt="Sign Up for E-mail Updates">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/accounts/newsletter/subscription/319" class="copy-two-tier__t1">Sign Up for E-mail Updates</a>
							<div class="copy-two-tier__t2">Get e-mail updates about Shameless, including the latest videos, news, and more.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://instagram.com/shameless">
							<img src="http://www.sho.com/site/image-bin/images/408_5_0/408_5_0_prm-skoideb_144x81.jpg" alt="Shameless Kids of Instagram">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://instagram.com/shameless" class="copy-two-tier__t1">Shameless Kids of Instagram</a>
							<div class="copy-two-tier__t2">Follow the Gallaghers as they celebrate the 99% in their own way.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="https://itunes.apple.com/us/tv-season/shameless-season-4/id900241065?uo=4&amp;at=10lwtv&amp;ct=shame4">
							<img src="http://www.sho.com/site/image-bin/images/408_4_0/408_4_0_prm-keyart_144x81.jpg" alt="Download Season 4 of Shameless">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="https://itunes.apple.com/us/tv-season/shameless-season-4/id900241065?uo=4&amp;at=10lwtv&amp;ct=shame4" class="copy-two-tier__t1">Download Season 4 of Shameless</a>
							<div class="copy-two-tier__t2">Own Season 4 on iTunes today. </div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/galleries/901/image/2477">
							<img src="http://www.sho.com/site/image-bin/images/408_3_3361702/408_3_3361702_02_144x81.jpg" alt="Photos: The Many Looks of Fiona Gallagher">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/galleries/901/image/2477" class="copy-two-tier__t1">Photos: The Many Looks of Fiona Gallagher</a>
							<div class="copy-two-tier__t2">Check out Fiona at her best and worst.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/galleries/1541/image/3850">
							<img src="http://www.sho.com/site/image-bin/images/408_3_3375328/408_3_3375328_07_144x81.jpg" alt="Fiona &amp; Jimmy/Steve">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/galleries/1541/image/3850" class="copy-two-tier__t1">Fiona &amp; Jimmy/Steve</a>
							<div class="copy-two-tier__t2">Look back on Fiona &amp; Jimmy/Steve's relationship through photos.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/galleries/2261/image/5401">
							<img src="http://www.sho.com/site/image-bin/images/408_2_139855/408_2_139855_06_144x81.jpg" alt="Ian and Mickey's Most Memorable Moments">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/galleries/2261/image/5401" class="copy-two-tier__t1">Ian and Mickey's Most Memorable Moments</a>
							<div class="copy-two-tier__t2">Check out the Gallavich photo gallery.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/galleries/941">
							<img src="http://www.sho.com/site/image-bin/images/408_2_0/408_2_0_dmc03_144x81.jpg" alt="The Gallagher Boys: Then and Now">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/galleries/941" class="copy-two-tier__t1">The Gallagher Boys: Then and Now</a>
							<div class="copy-two-tier__t2">Flip through photos of Lip, Carl, Ian, and Liam over the years.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://store.sho.com/shameless-gallavich-t-shirt/detail.php?p=775791&amp;ecid=PRF-SHO-S02323&amp;pa=PRF-SHO-S02323">
							<img src="http://www.sho.com/site/image-bin/images/408_2_0/408_2_0_prm-gallavich_144x81.jpg" alt="Shameless #Gallavich T-Shirt">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://store.sho.com/shameless-gallavich-t-shirt/detail.php?p=775791&amp;ecid=PRF-SHO-S02323&amp;pa=PRF-SHO-S02323" class="copy-two-tier__t1">Shameless #Gallavich T-Shirt</a>
							<div class="copy-two-tier__t2">Show you're a fan of the unlikely pairing of Ian Gallagher and Mickey Milkovich with the Shameless #Gallavich T-Shirt. </div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://store.sho.com/shameless-f-off-eye-mask/detail.php?p=374500&amp;v=showtime_shows_shameless&amp;ecid=PRF-SHO-S01447 &amp;pa=PRF-SHO-S01447">
							<img src="http://www.sho.com/site/image-bin/images/408_2_0/408_2_0_prm-eyemask_144x81.jpg" alt="Shameless Eye Mask">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://store.sho.com/shameless-f-off-eye-mask/detail.php?p=374500&amp;v=showtime_shows_shameless&amp;ecid=PRF-SHO-S01447 &amp;pa=PRF-SHO-S01447" class="copy-two-tier__t1">Shameless Eye Mask</a>
							<div class="copy-two-tier__t2">Get your beauty sleep with this Shameless Eye Mask at the Showtime Store. </div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="http://ad.apps.fm/q7jJxHCioLplTEpOTI029a914wHrDm-B2krNaaQ_1TO-_MKmv-z5gKcyD4fVvqBgCa8i-YmaLIirbtvJwxjccYB84QmJ3yZeiUcH-piy6LbzFmW2ducb4nETDrG8rndb">
							<img src="http://www.sho.com/site/image-bin/images/408_3_0/408_3_0_prm-shosync_144x81.jpg" alt="SHO Sync">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="http://ad.apps.fm/q7jJxHCioLplTEpOTI029a914wHrDm-B2krNaaQ_1TO-_MKmv-z5gKcyD4fVvqBgCa8i-YmaLIirbtvJwxjccYB84QmJ3yZeiUcH-piy6LbzFmW2ducb4nETDrG8rndb" class="copy-two-tier__t1">SHO Sync</a>
							<div class="copy-two-tier__t2">Enhance the live TV viewing experience of your favorite Showtime Original Series with the app for iPhone and iPad. Check out special features, trivia, polls, predictions, and more.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/red-rewards/featured-challenges">
							<img src="http://www.sho.com/site/image-bin/images/0_0_0/0_0_0_prm-rrstepsb_144x81.jpg" alt="Earn Points for Being a Fan">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/red-rewards/featured-challenges" class="copy-two-tier__t1">Earn Points for Being a Fan</a>
							<div class="copy-two-tier__t2">Sign up for Red Rewards to earn points for watching videos and taking challenges on SHO.com.</div>
							</div>
						</div>
					</div>	


					<div class="media media--promo">
						<a class="media__img" href="/sho/shameless/socialize">
							<img src="http://www.sho.com/assets/images/series/shameless/s2/promos/408_1_0_prm-socialize_144x81.jpg" alt="Join the Conversation">
						</a>
						<div class="media__body">
							<div class="copy-two-tier">
							<a href="/sho/shameless/socialize" class="copy-two-tier__t1">Join the Conversation</a>
							<div class="copy-two-tier__t2">Check out what other Shameless fans are saying about the show.</div>
							</div>
						</div>
					</div>	
				</div><!-- END col-sm-6 -->
		</div><!-- END row -->
	
	</div><!-- END col-sm-6 (outer middle col) -->

	<div class="col-sm-3">
		<div class="block">
			<h2>About the Series</h2>
			<p itemprop="about">Oscar®-nominated William H. Macy and Emmy Rossum star in this fiercely engaging and fearlessly twisted series. Chicagoan Frank Gallagher is the proud single dad of six smart, industrious, independent kids, who without him would be...perhaps better off. When Frank&#039;s not at the bar spending what little money they have, he&#039;s passed out on the floor. But the kids have found ways to grow up in spite of him. They may not be like any family you know, but they make no apologies for being exactly who they are.</p>
		</div>
	</div><!-- END col-sm about -->

	</div><!-- END row.secondary -->
	</div><!-- END timber.container -->


