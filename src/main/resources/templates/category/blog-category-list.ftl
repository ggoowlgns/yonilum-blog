<!DOCTYPE html>
<html lang="en">
<#include "../header/default-css.ftl">
<body>
<#include "../header/default.ftl">
  <script>
    var postings = []
    var userId = ${user.userId};
    var category = '${categoryName}'

    var postingRequest = RestClient.GET('/api/posting/list?page=0&size=7');
    if (category !== "All") postingRequest = RestClient.GET('/api/posting/list?category='+category+'&page=0&size=7');

    var posting_content_dom = $("#posting-content");

    postingRequest.done(function (data) {
      console.log("/posting/list : " )
      console.log(data)
        var postings = []
        for (var posting_index in data.content) {
          console.log(data[posting_index])
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
        let total_elements = data.totalElements
        let pageCount = data.totalPages
        let elementCountInPage = data.size
        categoryGenerator(postings);
    });


    function categoryGenerator(data) {
        function getLayout() {
            let $activeCategoryItem = $(".category__header__filter__item.active");
            let $categoryContent = $(".category_content");
            const currentLayout = $activeCategoryItem.data("layout");
            let content = "";
            if (currentCategoryLayout === currentLayout) {
                return;
            }
            currentCategoryLayout = currentLayout;
            if (currentCategoryLayout === "grid") {
                data.forEach((item, index) => {
                    content += `
                      <div class="post-card -center"><a class="card__cover" href="/posting/`+item.postingId+`"><img src="`+item.image+`" alt="`+item.title+`"></a>
                        <div class="card__content">
                        <h5 class="card__content-category">`+item.category+`</h5><a class="card__content-title" href="/posting/`+item.postingId+`">`+item.title+`</a>
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

                $categoryContent
                    .empty()
                    .addClass("-grid")
                    .removeClass("-list")
                    .prepend(content);
                let $masonryBeauty = $categoryContent.masonry({
                    itemSelector: ".post-card",
                    gutter: 20,
                });
                $masonryBeauty.imagesLoaded().progress(function () {
                    $masonryBeauty.masonry("layout");
                });
            } else {
                $categoryContent.masonry("destroy");
                data.forEach((item, index) => {
                    content += `
                    <div class="col-12">
                      <div class="post-card -small -horizontal"><a class="card__cover" href="/posting/`+item.postingId+`" tabindex="0"><img src="`+item.image+`" alt="`+item.title+`"></a>
                        <div class="card__content">
                          <h5 class="card__content-category">`+item.category+`</h5><a class="card__content-title" href="/posting/`+item.postingId+`" tabindex="0">`+item.title+`</a>
                          <div class="card__content-info">
                            <div class="info__time"><i class="far fa-clock"></i>
                              <p>`+item.date+`</p>
                            </div>
                            <div class="info__comment"><i class="far fa-comment"></i>
                              <p>`+item.comment+`</p>
                            </div>
                          </div>
                          <p class="card__content-description">`+item.content+`</p>
                        </div>
                      </div>
                    </div>`;
                });
                content = `<div class="row">` + content + `</div>`;
                $categoryContent
                    .empty()
                    .addClass("-list")
                    .removeClass("-grid")
                    .prepend(content);
            }
        }

        getLayout();
        $(".category__header__filter__item").on("click", function (e) {
            e.preventDefault();
            $(".category__header__filter__item").removeClass("active");
            $(this).addClass("active");
            getLayout();
        });
    }
  </script>
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
            <#include "/common/common-rights.ftl">
            <#include "/category/blog-category-center.ftl">
          </div>
        </div>
      </div>
    </div>
    <#include "/footer/default.ftl">
  </body>
</html>