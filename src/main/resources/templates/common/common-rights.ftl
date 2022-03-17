<#--from category-->
<div class="col-12 col-md-5 col-lg-4 order-md-2">
<#--<div class="col-12 col-md-4 order-md-2">-->
  <script>
      var categoryRequest = RestClient.GET('/api/category/top' + '?count=5');
      categoryRequest.done(function (data) {
          console.log(data);
          var categoriesDom = $('#posting-categories');
          addCategory(data, categoriesDom)
      })
      var trendingPostRequest = RestClient.GET('/api/posting/top' + '?count=5');
      trendingPostRequest.done(function (data) {
          console.log(data);
          var trendingPostDom = $('#posting-trending-post');
          addTrendingPost(data, trendingPostDom)
      })


      function addCategory(categories, categoriesDom) {
          for (var category of categories.content) {
              var categoryDom = '<a class="category -bar " href="/category?categoryName='+ category.category+'">' +
                  '<div class="category__background" style="background-image: url(/assets/images/backgrounds/category-1.png)"></div>' +
                  '<h5 class="title">'+category.category+'</h5>' +
                  '<h5 class="quantity">'+category.categoryCount+'</h5>' +
                  '</a>'
              categoriesDom.append(categoryDom)
          }
      }

      function addTrendingPost(trendingPosts, trendingPostDom) {
          var trendPostingContents = trendingPosts.content
          for (var postingIndex in trendPostingContents) {
              var posting = trendPostingContents[postingIndex]
              var postingDom = '<div class="trending-post">'+
                  '<div class="trending-post_image">' +
                  '<div class="rank">'+(Number(postingIndex)+1)+'</div><img src="'+posting.thumbnailUrl+'" alt="'+posting.title+'"/>' +
                  '</div>' +
                  '<div class="trending-post_content">' +
                  '<h5>'+ (posting.postingCategories.length > 0 ? posting.postingCategories[0].category : '') +'</h5><a href="/posting/'+posting.postingId+'">'+posting.title+'</a>' +
                  '<div class="info__time"><i class="far fa-clock"></i>' +
                  '<p>'+posting.createdDatetime+'</p>' +
                  '</div>' +
                  '</div>' +
                  '</div>'
              trendingPostDom.append(postingDom)
          }
      }
  </script>

  <div class="blog-sidebar">
    <div id="posting-categories" class="blog-sidebar-section -category">
      <div class="center-line-title">
        <h5>Categories</h5>
      </div>
        <#--    <a class="category -bar " href="../blog_category_grid.ftl">
              <div class="category__background" style="background-image: url(/assets/images/backgrounds/category-1.png)"></div>
              <h5 class="title">Design</h5>
              <h5 class="quantity">12</h5>
            </a>-->
    </div>

    <div id="posting-trending-post" class="blog-sidebar-section -trending-post">
      <div class="center-line-title">
        <h5>Trending post</h5>
      </div>
        <#--<div class="trending-post">
          <div class="trending-post_image">
            <div class="rank">1</div><img src="/assets/images/backgrounds/trending-post-1.png" alt="Shifting to Vegan Diets May Cause Brain Nutrient..."/>
          </div>
          <div class="trending-post_content">
            <h5>Illustrator</h5><a href="../post_standard.ftl">Shifting to Vegan Diets May Cause Brain Nutrient...</a>
            <div class="info__time"><i class="far fa-clock"></i>
              <p>Seb 27, 2019</p>
            </div>
          </div>
        </div>-->
    </div>
      <#--  <form class="subcribe-box subcribe-box" action="/" method="POST">
          <h5>Subcribe</h5>
          <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed tempor.</p>
          <input placeholder="Your email" name="email" type="email"/><a class="btn -normal" href="#">Subcribe</a>
        </form>-->
  </div>
</div>