<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Homepage 5</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap"/>
    <link rel="stylesheet" href="https://kit-pro.fontawesome.com/releases/v5.13.0/css/pro.min.css"/>
    <link rel="shortcut icon" type="image/png" href="./assets/images/fav.png"/>
    <!--build:css assets/css/styles.min.css-->
    <link rel="stylesheet" href="assets/css/elegant.css"/>
    <link rel="stylesheet" href="assets/css/custom_bootstrap.css"/>
    <link rel="stylesheet" href="assets/css/slick.css"/>
    <link rel="stylesheet" href="assets/css/plyr.min.css"/>
    <link rel="stylesheet" href="assets/css/style.css"/>
    <!--endbuild-->
  </head>
  <body>
    <div id="load">
      <div class="load__content">
        <div class="load__icon"><img src="assets/images/icons/load.gif" alt="Loading icon"/></div>
      </div>
    </div>
    <header class="theme-default">
      <div id="search-box">
        <div class="container">
          <form action="/" method="POST">
            <input type="text" placeholder="Searching for news" name="search"/>
            <button><i class="fas fa-arrow-right"></i></button>
          </form>
        </div>
      </div>
      <div class="container">
        <div class="header-wrapper"><a class="header__logo" href="index.ftl"><img src="./assets/images/logo.png" alt="Logo"/></a>
          <nav>
            <ul>
              <li class="nav-item active"><a href="index.ftl">Home</a>
                <ul class="dropdown-menu">
                  <li><a href="index.ftl">HOMEPAGE1</a></li>
                  <li><a href="homepage2.ftl">HOMEPAGE2</a></li>
                  <li><a href="homepage3.ftl">HOMEPAGE3</a></li>
                  <li><a href="../homepage4.ftl">HOMEPAGE4</a></li>
                  <li><a href="homepage5.ftl">HOMEPAGE5</a></li>
                  <li><a href="homepage6.ftl">HOMEPAGE6</a></li>
                  <li><a href="homepage7.ftl">HOMEPAGE7</a></li>
                  <li><a href="homepage8.ftl">HOMEPAGE8</a></li>
                  <li><a href="homepage9.ftl">HOMEPAGE9</a></li>
                </ul>
              </li>
              <li class="nav-item"><a>Blog</a>
                <ul class="dropdown-menu">
                  <li><a href="../blog_category_grid.ftl">BLOG CATEGORY GRID</a></li>
                  <li><a href="../blog_category_list.ftl">BLOG CATEGORY LIST</a></li>
                  <li><a href="../post_standard.ftl">POST STANDARD</a></li>
                  <li><a href="../post_standard_image_full.ftl">POST STANDARD IMAGE FULLWIDTH</a></li>
                  <li><a href="../post_standard_sidebar.ftl">POST STANDARD SIDEBAR</a></li>
                  <li><a href="../post_gallery.ftl">POST GALLERY</a></li>
                  <li><a href="../post_video.ftl">POST VIDEO</a></li>
                  <li><a href="../post_audio.ftl">POST AUDIO</a></li>
                  <li><a href="../post_quote.ftl">POST QUOTE</a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="#">Pages</a>
                <ul class="dropdown-menu">
                  <li><a href="../author.ftl">AUTHOR</a></li>
                  <li><a href="../about.ftl">ABOUT</a></li>
                  <li><a href="../contact.ftl">CONTACT</a></li>
                  <li><a href="../shop.ftl">SHOP</a></li>
                  <li><a href="../product_detail.ftl">PRODUCT DETAIL</a></li>
                  <li><a href="../cart.ftl">CART</a></li>
                  <li><a href="../checkout.ftl">CHECKOUT</a></li>
                  <li><a href="../error_404.ftl">ERROR</a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="../about.ftl">About</a></li>
              <li class="nav-item"><a href="../contact.ftl">Contact</a></li>
            </ul>
          </nav>
          <div class="header__icon-group"><a href="#" id="search"><i class="fas fa-search"></i></a>
            <div class="social"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-dribbble"></i></a><a id="mobile-menu-controller" href="#"><i class="fas fa-bars"></i></a></div>
          </div>
        </div>
      </div>
    </header>
    <div id="content">
      <div class="container">
        <div class="blog-imageless-mansonry">
          <div class="blog-imageless-mansonry__categories"><a class="category -round " href="../blog_category_grid.ftl">
                  <div class="category__background" style="background-image: url(assets/images/instagram/1.png)"></div>
                  <h5 class="title">Design</h5>
                  <h5 class="quantity">12</h5></a><a class="category -round " href="../blog_category_grid.ftl">
                  <div class="category__background" style="background-image: url(assets/images/instagram/2.png)"></div>
                  <h5 class="title">Graphic</h5>
                  <h5 class="quantity">63</h5></a><a class="category -round " href="../blog_category_grid.ftl">
                  <div class="category__background" style="background-image: url(assets/images/instagram/3.png)"></div>
                  <h5 class="title">Illustrator</h5>
                  <h5 class="quantity">15</h5></a><a class="category -round " href="../blog_category_grid.ftl">
                  <div class="category__background" style="background-image: url(assets/images/instagram/4.png)"></div>
                  <h5 class="title">Typography</h5>
                  <h5 class="quantity">58</h5></a><a class="category -round " href="../blog_category_grid.ftl">
                  <div class="category__background" style="background-image: url(assets/images/instagram/5.png)"></div>
                  <h5 class="title">Photos</h5>
                  <h5 class="quantity">120</h5></a>
          </div>
          <div class="blog-imageless-mansonry__content">
                <div class="post-card -center -middle -inner-text -small"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/1.png" alt="How to name, save and export a finish template"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="../post_standard.ftl">How to name, save and export a finish template</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -big"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/big-1.png" alt="Looking for some feedback for this rejected track"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="../post_standard.ftl">Looking for some feedback for this rejected track</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -long"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/long-1.png" alt="How to name, save and export a finish template"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="../post_standard.ftl">How to name, save and export a finish template</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -small"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/3.png" alt="Looking for some feedback for this rejected track"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="../post_standard.ftl">Looking for some feedback for this rejected track</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -small"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/5.png" alt="where I can found the sound in this video template?"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Design</h5><a class="card__content-title" href="../post_standard.ftl">where I can found the sound in this video template?</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -big"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/big-2.png" alt="How to name, save and export a finish template"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="../post_standard.ftl">How to name, save and export a finish template</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -long"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/long-2.png" alt="I want to create a logo with illustrator hacker"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="../post_standard.ftl">I want to create a logo with illustrator hacker</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -small"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/2.png" alt="How to name, save and export a finish template"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="../post_standard.ftl">How to name, save and export a finish template</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -long"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/long-3.png" alt="where I can found the sound in this video template?"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Design</h5><a class="card__content-title" href="../post_standard.ftl">where I can found the sound in this video template?</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -small"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/4.png" alt="I want to create a logo with illustrator hacker"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="../post_standard.ftl">I want to create a logo with illustrator hacker</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -big"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/big-3.png" alt="I want to create a logo with illustrator hacker"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="../post_standard.ftl">I want to create a logo with illustrator hacker</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="post-card -center -middle -inner-text -small"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/masonry_row/6.png" alt="How to name, save and export a finish template"/></a>
                  <div class="card__content">
                    <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="../post_standard.ftl">How to name, save and export a finish template</a>
                    <div class="card__content-info">
                      <div class="info__time"><i class="far fa-clock"></i>
                        <p>Clock  Wed 02, 2019</p>
                      </div>
                      <div class="info__comment"><i class="far fa-comment"></i>
                        <p>3</p>
                      </div>
                    </div>
                  </div>
                </div>
          </div>
          <div class="center"><a class="btn -normal load-more-btn mb-0" href="#">Load more posts</a></div>
        </div>
      </div>
    </div>
    <footer>
      <div class="container">
        <div class="footer-content">
          <div class="row">
            <div class="col-12 col-md-6 col-lg-4">
              <div class="footer-col -about">
                <div class="center-line-title"> 
                  <h5>About us</h5>
                </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida lacus vel facilisis. </p>
                <div class="contact-method">
                  <p> <i class="fas fa-map-marker-alt"></i>5 South Main Street Los Angeles, ZZ-96110 USA</p>
                  <p> <i class="far fa-mobile-android"></i>125-711-811   |   125-668-886</p>
                  <p> <i class="fas fa-headphones-alt"></i>Support.hosting@gmail.com</p>
                </div>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4">
              <div class="footer-col -feature-post">
                <div class="center-line-title"> 
                  <h5>Feature posts</h5>
                </div>
                <div class="feature-post-block">
                      <div class="post-card -tiny"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/1.png" alt="Looking for some feedback for this rejected track"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="../post_standard.ftl">Looking for some feedback for this rejected track</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/2.png" alt="How to name, save and export a finish template"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="../post_standard.ftl">How to name, save and export a finish template</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="../post_standard.ftl"><img src="assets/images/posts/3.png" alt="I want to create a logo with illustrator hacker"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="../post_standard.ftl">I want to create a logo with illustrator hacker</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-md-12 col-lg-4">
              <div class="footer-col -util">
                <div class="row">
                  <div class="col-12 col-md-6 col-lg-12">
                    <div class="center-line-title"> 
                      <h5>Tag clouds</h5>
                    </div>
                    <div class="tags-group"><a class="tag-btn" href="../blog_category_grid.ftl">Gutenews</a><a class="tag-btn" href="../blog_category_grid.ftl">Lifestyle</a><a class="tag-btn" href="../blog_category_grid.ftl">Fashion</a><a class="tag-btn" href="../blog_category_grid.ftl">Technology</a><a class="tag-btn" href="../blog_category_grid.ftl">Food</a><a class="tag-btn" href="../blog_category_grid.ftl">Travel</a>
                    </div>
                  </div>
                  <div class="col-12 col-md-6 col-lg-12">
                    <div class="center-line-title"> 
                      <h5>Follow us</h5>
                    </div>
                    <div class="social-block"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-dribbble"></i></a></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="copyright">
          <p>© 2019, GuteNews - News Magazine WordPress Theme. All rights reserved.</p>
        </div>
      </div>
    </footer>
  </body>
</html>