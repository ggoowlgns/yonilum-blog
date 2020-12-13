<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Tigris - Personal Portfolio Template" />
	<meta name="keywords" content="business card, creative, creative portfolio, cv theme, online resume, personal, portfolio, professional cv, responsive portfolio, resume, resume theme, vcard" />
	<meta name="author" content="beingeorge" />
	<meta name="theme-color" content="#1f1f20">

	<title>Tigris - Personal Portfolio Template</title>

	<!-- CSS -->
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">

	<!-- Font Awesome CSS -->
	<link href="assets/css/all.css" rel="stylesheet" media="screen">

	<!--[if lte IE 7]> 
		<script src="assets/js/icons-lte-ie7.js"></script>
	<![endif]-->

	<link href="assets/css/vendor.css" rel="stylesheet">

	<!-- Tigris styles CSS -->
	<link href="assets/css/Tigris.css" rel="stylesheet" media="screen">


	<link href="assets/css/custom.css" rel="stylesheet" media="screen">
</head>
<body>

	<!-- Preloader : Start -->

	<div id="loading">
		<div id="loading-center">
			<div class="spinner-grow" role="status">
			  <span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>

	<!-- Preloader : End  -->

	<!-- Navigation start -->

	<div class="menu-wrapper">
		<button class="hamburger-menu">
			<span class='hamburger'></span>
			<span class='hamburger-overlay'></span>	
		</button>
		<div class="Menu ham-tilt">
			<ul class="Menu-list" >
				<li class="Menu-list-item">
					<a href="index.ftl#home">Home</a>
				</li>
				<li class="Menu-list-item">
					<a href="index.ftl#portfolio">Work</a>
				</li>
				<li class="Menu-list-item">
					<a href="index.ftl#services">Services</a>
				</li>
				<li class="Menu-list-item">
					<a href="index.ftl#blog">Blog</a>
				</li>
				<li class="Menu-list-item">
					<a href="index.ftl#contact">Contact</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- Navigation end -->

	<!-- Portfolio start -->

	<section id="blog-page" class="module">
		<div class="container">
			<div class="row">

				<div class="module-header wow fadeInUp">
					<h2 class="module-title"> Blog </h2>
					<div class="module-line"></div>
				</div>

			</div><!-- .row -->

			<!-- Portfolio Filter start-->

			<div class="row">

				<div class="col-sm-12">

					<ul id="filter">
						<li class="active" data-group="all">All</li>
						<li data-group="design">Design</li>
						<li data-group="travel">Travel</li>
						<li data-group="passion">Passion</li>
					</ul>

				</div>

			</div><!-- .row -->

			<!-- Portfolio Filter end -->

		

			<ul class="list-items-container blog-wrapper">

				<li class="list-item" data-groups="all design">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/blog1.jpg" alt="Blog Desc">
							<span>Design</span>
						</div>
						<div class="blogList-desc">
							<h3>10 tips for drawing with coloured pencils</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

				<li class="list-item" data-groups="all travel">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/blog2.jpg" alt="Blog Desc">
							<span>Travel</span>
						</div>
						<div class="blogList-desc">
							<h3>The single greatest gift to get your friend who always travels</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

				<li class="list-item" data-groups="all passion">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/blog3.jpg" alt="Blog Desc">
							<span>Passion</span>
						</div>
						<div class="blogList-desc">
							<h3>Why all women should eat alone </h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

				<li class="list-item" data-groups="all design">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/p2-2.jpg" alt="Blog Desc">
							<span>design</span>
						</div>
						<div class="blogList-desc">
							<h3>The single greatest gift to get your friend who always travels</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

				<li class="list-item" data-groups="all travel">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/p3-3.jpg" alt="Blog Desc">
							<span>Travel</span>
						</div>
						<div class="blogList-desc">
							<h3>Why all women should eat alone </h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

				<li class="list-item" data-groups="all passion">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/p4-4.jpg" alt="Blog Desc">
							<span>Passion</span>
						</div>
						<div class="blogList-desc">
							<h3>The single greatest gift to get your friend who always travels</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

				<li class="list-item" data-groups="all travel">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/p5-5.jpg" alt="Blog Desc">
							<span>Travel</span>
						</div>
						<div class="blogList-desc">
							<h3>The single greatest gift to get your friend who always travels</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

				<li class="list-item" data-groups="all passion">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/blog3.jpg" alt="Blog Desc">
							<span>Passion</span>
						</div>
						<div class="blogList-desc">
							<h3>Why all women should eat alone </h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>
				
				<li class="list-item" data-groups="all design">
					<a href="blog-detail.ftl" class="blogList wow fadeInUp">
						<div class="blogList-img">
							<img src="assets/images/p6-6.jpg" alt="Blog Desc">
							<span>design</span>
						</div>
						<div class="blogList-desc">
							<h3>The single greatest gift to get your friend who always travels</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim...</p>
						</div>
					</a>
				</li>

			</ul><!-- .projects-container -->
		</div><!-- .contaier -->

	</section>

	<!-- Portfolio end -->


	<!-- Footer start -->

	<footer id="footer" class="module-gray">
		<div class="container">
			<div class="row">

				<div class="col-sm-12">

					<a href="#home" class="footer-logo"><h2>Tigris</h2></a>

					<ul class="social-links">
						<li><a href="#" class="wow fadeInUp">Facebook</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".1s">Twitter</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".2s">Dribble</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".3s">Linkedin</a></li>
						<li><a href="#" class="wow fadeInUp" data-wow-delay=".4s">Pinterest</a></li>
					</ul>

					<p class="copyright wow fadeInUp">
						© 2020 beingeorge, All Rights Reserved.
					</p>

				</div>

			</div><!-- .row -->
		</div><!-- .container -->
	</footer>

	<!-- Footer end -->

	<!-- Scroll-up -->

	<div class="scroll-up">
		<a href="#home" id="scroll-up"><i class="fas fa-arrow-up"></i></a>
	</div>

	<!-- Javascript files -->

	<script src="assets/js/vendor.js"></script>
	
	<!-- Popper JS -->
	<script src="assets/bootstrap/js/popper.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- Custom scripts -->
	<script src="assets/js/custom.js"></script>
	<script src="assets/js/custom-shuffle-init.js"></script>

</body>
</html>