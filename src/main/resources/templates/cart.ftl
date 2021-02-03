<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Cart</title>
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
        <div class="header-wrapper"><a class="header__logo" href="index.html"><img src="./assets/images/logo.png" alt="Logo"/></a>
          <nav>
            <ul>
              <li class="nav-item"><a href="index.html">Home</a>
                <ul class="dropdown-menu">
                  <li><a href="index.html">HOMEPAGE1</a></li>
                  <li><a href="homepage2.html">HOMEPAGE2</a></li>
                  <li><a href="homepage3.html">HOMEPAGE3</a></li>
                  <li><a href="homepage4.html">HOMEPAGE4</a></li>
                  <li><a href="homepage5.html">HOMEPAGE5</a></li>
                  <li><a href="homepage6.html">HOMEPAGE6</a></li>
                  <li><a href="homepage7.html">HOMEPAGE7</a></li>
                  <li><a href="homepage8.html">HOMEPAGE8</a></li>
                  <li><a href="homepage9.html">HOMEPAGE9</a></li>
                </ul>
              </li>
              <li class="nav-item"><a>Blog</a>
                <ul class="dropdown-menu">
                  <li><a href="blog_category_grid.html">BLOG CATEGORY GRID</a></li>
                  <li><a href="blog_category_list.html">BLOG CATEGORY LIST</a></li>
                  <li><a href="post_standard.html">POST STANDARD</a></li>
                  <li><a href="post_standard_image_full.html">POST STANDARD IMAGE FULLWIDTH</a></li>
                  <li><a href="post_standard_sidebar.html">POST STANDARD SIDEBAR</a></li>
                  <li><a href="post_gallery.html">POST GALLERY</a></li>
                  <li><a href="post_video.html">POST VIDEO</a></li>
                  <li><a href="post_audio.html">POST AUDIO</a></li>
                  <li><a href="post_quote.html">POST QUOTE</a></li>
                </ul>
              </li>
              <li class="nav-item active"><a href="#">Pages</a>
                <ul class="dropdown-menu">
                  <li><a href="author.html">AUTHOR</a></li>
                  <li><a href="about.html">ABOUT</a></li>
                  <li><a href="contact.html">CONTACT</a></li>
                  <li><a href="shop.html">SHOP</a></li>
                  <li><a href="product_detail.html">PRODUCT DETAIL</a></li>
                  <li><a href="cart.html">CART</a></li>
                  <li><a href="checkout.html">CHECKOUT</a></li>
                  <li><a href="error_404.html">ERROR</a></li>
                </ul>
              </li>
              <li class="nav-item"><a href="about.html">About</a></li>
              <li class="nav-item"><a href="contact.html">Contact</a></li>
            </ul>
          </nav>
          <div class="header__icon-group"><a href="#" id="search"><i class="fas fa-search"></i></a>
            <div class="social"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-dribbble"></i></a><a id="mobile-menu-controller" href="#"><i class="fas fa-bars"></i></a></div>
          </div>
        </div>
      </div>
    </header>
    <div class="no-pd" id="content">
      <div class="container">
            <div class="breadcrumb">
              <ul>
                <li><a href="index.html"> <i class="fas fa-home"></i>Home</a></li>
                <li><a href="#">Blog</a></li>
                <li class="active"><a href="#">Cart</a></li>
              </ul>
            </div>
        <div class="cart">
          <div class="cart__table">
            <table>
              <colgroup>
                <col span="1" style="width: 50%;"/>
                <col span="1" style="width: 15%;"/>
                <col span="1" style="width: 15%;"/>
                <col span="1" style="width: 15%;"/>
                <col span="1" style="width: 5%;"/>
              </colgroup>
              <thead>
                <tr>
                  <th>PRODUCT</th>
                  <th>PRICE</th>
                  <th>QUATILITY</th>
                  <th>TOTAL</th>
                  <th> </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    <div class="cart-product"><img src="assets/images/pages/cart/1.png" alt="Furry hooded parka"/>
                      <div class="cart-product__content">
                        <h5>Furry hooded parka</h5>
                        <div class="star" data-number="4"></div>
                      </div>
                    </div>
                  </td>
                  <td>$ 15</td>
                  <td>
                    <div class="quantity-controller"><a class="decrease-btn" href="#">-</a>
                      <input class="result" type="text" readonly="readonly" value="01"/><a class="increase-btn" href="#">+</a>
                    </div>
                  </td>
                  <td>$ 15</td>
                  <td><a href="javascript:void(0)"><i class="fas fa-times"></i></a></td>
                </tr>
                <tr>
                  <td>
                    <div class="cart-product"><img src="assets/images/pages/cart/2.png" alt="Furry hooded parka"/>
                      <div class="cart-product__content">
                        <h5>Furry hooded parka</h5>
                        <div class="star" data-number="4"></div>
                      </div>
                    </div>
                  </td>
                  <td>$ 18</td>
                  <td>
                    <div class="quantity-controller"><a class="decrease-btn" href="#">-</a>
                      <input class="result" type="text" readonly="readonly" value="01"/><a class="increase-btn" href="#">+</a>
                    </div>
                  </td>
                  <td>$ 18</td>
                  <td><a href="javascript:void(0)"><i class="fas fa-times"></i></a></td>
                </tr>
                <tr>
                  <td>
                    <div class="cart-product"><img src="assets/images/pages/cart/3.png" alt="Furry hooded parka"/>
                      <div class="cart-product__content">
                        <h5>Furry hooded parka</h5>
                        <div class="star" data-number="4"></div>
                      </div>
                    </div>
                  </td>
                  <td>$ 25</td>
                  <td>
                    <div class="quantity-controller"><a class="decrease-btn" href="#">-</a>
                      <input class="result" type="text" readonly="readonly" value="01"/><a class="increase-btn" href="#">+</a>
                    </div>
                  </td>
                  <td>$ 25</td>
                  <td><a href="javascript:void(0)"><i class="fas fa-times"></i></a></td>
                </tr>
                <tr>
                  <td>
                    <div class="cart-product"><img src="assets/images/pages/cart/4.png" alt="Furry hooded parka"/>
                      <div class="cart-product__content">
                        <h5>Furry hooded parka</h5>
                        <div class="star" data-number="4"></div>
                      </div>
                    </div>
                  </td>
                  <td>$ 22</td>
                  <td>
                    <div class="quantity-controller"><a class="decrease-btn" href="#">-</a>
                      <input class="result" type="text" readonly="readonly" value="01"/><a class="increase-btn" href="#">+</a>
                    </div>
                  </td>
                  <td>$ 22</td>
                  <td><a href="javascript:void(0)"><i class="fas fa-times"></i></a></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="cart__footer">
            <div class="cart__footer__actions"><a class="btn -light-overlay" href="shop.html">CONTINUE SHOPPING</a><a class="btn -light-overlay" href="shop.html">Upadte cart</a></div>
          </div>
          <div class="cart__total">
            <div class="row justify-content-between">
              <div class="col-12 col-md-8 col-lg-7">
                <div class="cart__total__discount">
                  <form action="/">
                    <h3>DISCOUNT CODES</h3>
                    <input type="text" name="discount" placeholder="Enter your coupon code"/>
                    <button class="btn">Apply</button>
                  </form>
                </div>
              </div>
              <div class="col-12 col-md-4">
                <div class="cart__total__content">
                  <h3>Cart total</h3>
                  <div class="total__row">
                    <h5>Subtotal</h5>
                    <h5>$ 152.0</h5>
                  </div>
                  <div class="total__row">
                    <h5>Subtotal</h5>
                    <h5>$ 152.0</h5>
                  </div><a class="btn" href="checkout.html">PPROCEED TO CHECKOUT</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="subcribe-bar">
          <div class="row">
            <div class="col-12 col-md-6">
              <div class="subcribe-bar__content">
                <h5>Don’t miss our future updates!</h5>
                <h3>Get Subscribe today!</h3>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <form class="subcribe-bar__form" action="/">
                <input type="text" placeholder="You email"/>
                <button class="btn -normal">Subcribe  </button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="instagrams">
          <div class="instagrams-container"><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/1.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/2.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/3.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/4.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/5.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/1.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/3.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a><a class="instagrams-item" href="https://www.instagram.com/"><img src="assets/images/instagram/4.png" alt="Instagram image"/>
              <div class="instagrams-item__content"><i class="fab fa-instagram"></i>
                <p>@ Gtute_News</p>
              </div></a>
          </div>
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
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.html"><img src="assets/images/posts/1.png" alt="Looking for some feedback for this rejected track"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="post_standard.html">Looking for some feedback for this rejected track</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.html"><img src="assets/images/posts/2.png" alt="How to name, save and export a finish template"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="post_standard.html">How to name, save and export a finish template</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>Clock  Wed 02, 2019</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="post-card -tiny"><a class="card__cover" href="post_standard.html"><img src="assets/images/posts/3.png" alt="I want to create a logo with illustrator hacker"/></a>
                        <div class="card__content">
                          <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="post_standard.html">I want to create a logo with illustrator hacker</a>
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
                    <div class="tags-group"><a class="tag-btn" href="blog_category_grid.html">Gutenews</a><a class="tag-btn" href="blog_category_grid.html">Lifestyle</a><a class="tag-btn" href="blog_category_grid.html">Fashion</a><a class="tag-btn" href="blog_category_grid.html">Technology</a><a class="tag-btn" href="blog_category_grid.html">Food</a><a class="tag-btn" href="blog_category_grid.html">Travel</a>
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
    <!--build:js assets/js/main.min.js-->
    <script rel="script/javascript" src="assets/js/jquery.min.js"></script>
    <script rel="script/javascript" src="assets/js/slick.min.js"></script>
    <script rel="script/javascript" src="assets/js/plyr.min.js"></script>
    <script rel="script/javascript" src="assets/js/masonry.pkgd.min.js"></script>
    <script rel="script/javascript" src="assets/js/imagesloaded.pkgd.min.js"></script>
    <script rel="script/javascript" src="assets/js/vimeo.player.min.js"></script>
    <script rel="script/javascript" src="assets/js/main.js"></script>
    <!--endbuild-->
  </body>
</html>