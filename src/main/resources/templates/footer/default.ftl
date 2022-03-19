<script>
  // Trend Posting
  // all categories
  getTrendPostingAndSetCard();
  getAllCategoriesAndSetTag();


  function getTrendPostingAndSetCard() {
    var trendPostingRequest = RestClient.GET('/api/posting/top?count='+3);
    trendPostingRequest.done(function (data) {
      var postings = []
      for (var posting_index in data.content) {
        let temp_posting = data.content[posting_index]
        var result_posting = {}
        result_posting['image'] = temp_posting.thumbnailUrl;
        result_posting['category'] = temp_posting.postingCategories.map(e => e.category).join(", ");
        result_posting['title'] = temp_posting.title;
        result_posting['date'] = temp_posting.createdDatetime;
        result_posting['comment'] = temp_posting.postingComments.length;
        result_posting['postingId'] = temp_posting.postingId;
        let temp_paragraph = temp_posting.postingContentParagraphs[0].content
        const PARAGRAPH_LENGTH = 20;
        result_posting['content'] = temp_paragraph.length > PARAGRAPH_LENGTH ?
          temp_paragraph.substring(0, PARAGRAPH_LENGTH - 3) + "..." :
          temp_paragraph;
        postings.push(result_posting)
      }
      setPostingCard(postings);
    });
  }

  function setPostingCard(postings) {
    var $featurePosting = $('.feature-post-block');
    var content = ''
    postings.forEach((item, index) => {
      content += `
        <div class="post-card -tiny">
          <a class="card__cover" href="/posting/`+item.postingId+`">
            <img src="`+item.image+`" alt="`+item.title+`">
          </a>
          <div class="card__content">
            <h5 class="card__content-category">`+item.category+`</h5>
            <a class="card__content-title" href="/posting/`+item.postingId+`">`+item.title+`</a>
            <div class="card__content-info">
            <div class="info__time"><i class="far fa-clock"></i>
              <p>`+item.date+`</p>
            </div>
            <div class="info__comment"><i class="far fa-comment"></i>
              <p>`+item.comment+`</p>
            </div>
          </div>
        </div>
      </div>
      `;
    });
    $featurePosting
      .empty()
      .prepend(content);
  }


  function getAllCategoriesAndSetTag() {
    var categoryRequest = RestClient.GET('/api/category/top' + '?count=10');
    categoryRequest.done(function (data) {
      setCategoryTag(data)
    })

  }

  function setCategoryTag(categories) {
    var $categoryTagGroup = $('.tags-group');
    var categoriesContent = ''
    for (var category of categories.content) {
      categoriesContent += '<a class="tag-btn" href="/category?categoryName='+ category.category+'">'+category.category+'</a>'
      categoriesContent += '\n'
    }
    $categoryTagGroup
      .empty()
      .prepend(categoriesContent)
  }

</script>

<footer>
  <div class="container">
    <div class="footer-content">
      <div class="row">
          <#--<div class="col-12 col-md-6 col-lg-4">
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
          </div>-->
        <div class="col-12 col-md-6 col-lg-6">
          <div class="footer-col -feature-post">
            <div class="center-line-title">
              <h5>Trending posts</h5>
            </div>
            <div class="feature-post-block">
              <div class="post-card -tiny"><a class="card__cover" href="deprecated/post_standard.ftl"><img src="/assets/images/posts/1.png" alt="Looking for some feedback for this rejected track"/></a>
                <div class="card__content">
                  <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="deprecated/post_standard.ftl">Looking for some feedback for this rejected track</a>
                  <div class="card__content-info">
                    <div class="info__time"><i class="far fa-clock"></i>
                      <p>Clock  Wed 02, 2019</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="post-card -tiny"><a class="card__cover" href="deprecated/post_standard.ftl"><img src="/assets/images/posts/2.png" alt="How to name, save and export a finish template"/></a>
                <div class="card__content">
                  <h5 class="card__content-category">Typography</h5><a class="card__content-title" href="deprecated/post_standard.ftl">How to name, save and export a finish template</a>
                  <div class="card__content-info">
                    <div class="info__time"><i class="far fa-clock"></i>
                      <p>Clock  Wed 02, 2019</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="post-card -tiny"><a class="card__cover" href="deprecated/post_standard.ftl"><img src="/assets/images/posts/3.png" alt="I want to create a logo with illustrator hacker"/></a>
                <div class="card__content">
                  <h5 class="card__content-category">Graphic</h5><a class="card__content-title" href="deprecated/post_standard.ftl">I want to create a logo with illustrator hacker</a>
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
        <div class="col-12 col-md-12 col-lg-6">
          <div class="footer-col -util">
            <div class="row">
              <div class="col-12 col-md-6 col-lg-12">
                <div class="center-line-title">
                  <h5>Tag clouds</h5>
                </div>
                <div class="tags-group">
                  <a class="tag-btn" href="deprecated/blog_category_grid.ftl">Gutenews</a>
                  <a class="tag-btn" href="deprecated/blog_category_grid.ftl">Lifestyle</a>
                  <a class="tag-btn" href="deprecated/blog_category_grid.ftl">Fashion</a>
                  <a class="tag-btn" href="deprecated/blog_category_grid.ftl">Technology</a>
                  <a class="tag-btn" href="deprecated/blog_category_grid.ftl">Food</a>
                  <a class="tag-btn" href="deprecated/blog_category_grid.ftl">Travel</a>
                </div>
              </div>
              <div class="col-12 col-md-6 col-lg-12">
                <div class="center-line-title">
                  <h5>Follow us</h5>
                </div>
                <div class="social-block">
                  <a href="#"><i class="fab fa-facebook-f"></i></a>
                  <a href="#"><i class="fab fa-twitter"></i></a>
                  <a href="#"><i class="fab fa-instagram"></i></a>
                  <a href="#"><i class="fab fa-dribbble"></i></a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="copyright">
      <p>© 2022, Yonilum Blog . All rights reserved.</p>
    </div>
  </div>
</footer>
<#include "/footer/default-js.ftl">