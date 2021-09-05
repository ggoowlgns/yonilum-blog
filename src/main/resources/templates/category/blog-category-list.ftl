<!DOCTYPE html>
<html lang="en">
<#include "../header/default-css.ftl">
<body>
<#include "../header/default.ftl">
    <div class="no-pd" id="content">
      <div class="container">
            <div class="breadcrumb">
              <ul>
                <li><a href="../deprecated/index.ftl"> <i class="fas fa-home"></i>Home</a></li>
                <li><a href="#">Blog</a></li>
                <li class="active"><a href="#">Category</a></li>
              </ul>
            </div>
        <div class="category">
          <div class="row">
            <div class="col-12 col-md-5 col-lg-4 order-md-2">
              <div class="blog-sidebar">
                <div class="blog-sidebar-section -category">
                  <div class="center-line-title"> 
                    <h5>Categories</h5>
                  </div><a class="category -bar " href="../blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(/assets/images/backgrounds/category-1.png)"></div>
                                  <h5 class="title">Design</h5>
                                  <h5 class="quantity">12</h5></a><a class="category -bar " href="../blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(/assets/images/backgrounds/category-2.png)"></div>
                                  <h5 class="title">Graphic</h5>
                                  <h5 class="quantity">6</h5></a><a class="category -bar " href="../blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(/assets/images/backgrounds/category-3.png)"></div>
                                  <h5 class="title">Illustrator</h5>
                                  <h5 class="quantity">15</h5></a><a class="category -bar " href="../blog_category_grid.ftl">
                                  <div class="category__background" style="background-image: url(/assets/images/backgrounds/category-4.png)"></div>
                                  <h5 class="title">Typography</h5>
                                  <h5 class="quantity">8</h5></a>
                </div>
                <div class="blog-sidebar-section -trending-post">
                  <div class="center-line-title"> 
                    <h5>Trending post</h5>
                  </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">1</div><img src="/assets/images/backgrounds/trending-post-1.png" alt="Shifting to Vegan Diets May Cause Brain Nutrient..."/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Illustrator</h5><a href="../deprecated/post_standard.ftl">Shifting to Vegan Diets May Cause Brain Nutrient...</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">2</div><img src="/assets/images/backgrounds/trending-post-2.png" alt="The GQ Men Of The Year Awards 2019: Hrithik..."/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Design</h5><a href="../deprecated/post_standard.ftl">The GQ Men Of The Year Awards 2019: Hrithik...</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">3</div><img src="/assets/images/backgrounds/trending-post-3.png" alt="Here's How Your Diet Can Help Yo Excel in Exams"/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Illustrator</h5><a href="../deprecated/post_standard.ftl">Here's How Your Diet Can Help Yo Excel in Exams</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">4</div><img src="/assets/images/backgrounds/trending-post-4.png" alt="why others accept while AudioJungle..."/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Graphic</h5><a href="../deprecated/post_standard.ftl">why others accept while AudioJungle...</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                                <div class="trending-post">
                                  <div class="trending-post_image">
                                    <div class="rank">5</div><img src="/assets/images/backgrounds/trending-post-5.png" alt="Podcast audio episode with YouTube license question"/>
                                  </div>
                                  <div class="trending-post_content">
                                    <h5>Typography</h5><a href="../deprecated/post_standard.ftl">Podcast audio episode with YouTube license question</a>
                                    <div class="info__time"><i class="far fa-clock"></i>
                                      <p>Seb 27, 2019</p>
                                    </div>
                                  </div>
                                </div>
                </div>
                <form class="subcribe-box subcribe-box" action="/" method="POST">
                  <h5>Subcribe</h5>
                  <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed tempor.</p>
                  <input placeholder="Your email" name="email" type="email"/><a class="btn -normal" href="#">Subcribe</a>
                </form>
              </div>
            </div>
            <div class="col-12 col-md-7 col-lg-8 order-md-1">
              <div class="category__header">
                <div class="category__header__text">
                  <h5>Categories:</h5><a href="#">Typography</a>
                </div>
                <div class="category__header__filter"><a class="category__header__filter__item" href="javascript:void(0)" data-layout="grid"><i class="fas fa-th"></i></a><a class="category__header__filter__item active" href="javascript:void(0)" data-layout="list"><i class="fas fa-bars"></i></a></div>
              </div>
              <div class="category_content"></div>
                  <div class="pagination">
                    <ul>
                      <li class="active"><a href="javascript:void(0)">1</a></li>
                      <li class="pagination__page-number"><a href="javascript:void(0)">2</a></li>
                      <li class="pagination__page-number"><a href="javascript:void(0)">3</a></li>
                      <li><a class="next" href="javascript:void(0)">></a></li>
                    </ul>
                  </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <#include "/footer/default.ftl">
  </body>
</html>