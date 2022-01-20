<!DOCTYPE html>

<html lang="en">
  <#include "header/default-css.ftl">
  <body>
    <#include "header/default.ftl">
<script>
  var postings = []
  var userId = ${user.userId};
  var postingRequest = RestClient.GET('/api/posting/latest');
  postingRequest.done(function (data) {
    console.log("latest posting : " );
    console.log(data)
    for (var posting_index in data.content) {
      var posting = data.content[posting_index]
      if (posting_index == 0) {
        addMainPosting(posting)
      } else {
        addSubPosting(posting)
      }
      console.log(posting)
    }

  });

  var posting_content_dom = $("#posting-content");

  function addMainPosting(posting) {
    let postingId = posting.postingId
    let category = posting.postingCategories //array
    let title = posting.title
    let author_name = posting.user.name
    let created_datetime = posting.createdDatetime
    let comment_count = posting.postingComments.length
    let thumbnail_url = posting.thumbnailUrl
    let main_posting_dom = document.createElement('div')

    posting_content_dom.appendChild(main_posting_dom)

  }

  function addSubPosting(posting) {
    let postingId = posting.postingId
    let category = posting.postingCategories //array
    let title = posting.title
    let author_name = posting.user.name
    let created_datetime = posting.createdDatetime
    let comment_count = posting.postingComments.length
    let thumbnail_url = posting.thumbnailUrl
  }
</script>

    <div id="content">
      <div class="container">
        <div class="blog-imageless">
          <div class="row" id="posting-content">
            <div class="col-12">
                  <div class="post-card -center -banner -inner-text">
                    <a class="card__cover" href="/posting/1">
                      <img src="/assets/images/posts/banner-post.png" alt="Looking for some feedback for this rejected track"/>
                    </a>
                    <div class="card__content">
                      <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="/posting/1">Looking for some feedback for this rejected track</a>
                      <div class="card__content-info">
                        <div class="info__time info__author"><i class="far fa-user"></i>
                          <p>Jessica Stephens</p>
                        </div>
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
            <div class="col-12 col-lg-6">
              <div class="post-card -image-less">
                <div class="category-icon"><img src="/assets/images/icons/category-icon-technology.png" alt="Technology"/></div>
                <div class="card__content">
                  <h5 class="card__content-category">Technology</h5><a class="card__content-title" href="/posting/1">Looking for some feedback for this rejected track</a>
                  <div class="card__content-info">
                    <div class="info__time info__author"><i class="far fa-user"></i>
                      <p>Jessica Stephens</p>
                    </div>
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
            <div class="col-12">
              <div class="center"><a class="btn -normal load-more-btn" href="#">Load more posts</a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <#include "/footer/default.ftl">
  </body>
</html>