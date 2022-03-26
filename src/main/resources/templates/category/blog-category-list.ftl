<!DOCTYPE html>
<html lang="en">
<#include "../header/default-meta.ftl">
<body>
<#include "../header/default.ftl">
<script>
  $(document).ready(function () {
    $(".category__header__filter__item").on("click", function (e) {
      e.preventDefault();
      $(".category__header__filter__item").removeClass("active");
      $(this).addClass("active");
      setLayout();
    });
  })
</script>

  <script>
    var postings = []
    var userId = ${user.userId};
    var category = '${categoryName}'


    var posting_content_dom = $("#posting-content");
    let currentCategoryLayout = "";

    getAndSetPageList(category, 0)


    function getAndSetPageList(categoryName, pageNum) {
      var postingRequest = RestClient.GET('/api/posting/list?page='+pageNum+'&size=7');
      var __this = this;
      if (category !== "All") postingRequest = RestClient.GET('/api/posting/list?category='+categoryName+'&page='+pageNum+'&size=7');
      postingRequest.done(function (data) {

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

        let total_elements = data.totalElements;
        let pageCount = data.totalPages;
        let elementCountInPage = data.size;
        if (pageNum === 0 ) {
          initPageBtns(pageCount)
        }

        setPostingList(postings);
        __this.postings = postings;
      });
    }

    function setPostingList(data) {
        setLayout(data);
    }

    function setLayout(data) {
      if (data === undefined) {
        data = this.postings
      }
      let $activeCategoryItem = $(".category__header__filter__item.active");
      let $categoryContent = $(".category_content");
      $categoryContent.masonry("destroy");
      const currentLayout = $activeCategoryItem.data("layout");
      let content = "";
      // if (currentCategoryLayout === currentLayout) {
      //     return;
      // }
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
        /*masonry 를 쓰면 날라감 content 소속에서 빠짐*/
        let $masonryBeauty = $categoryContent.masonry({
          itemSelector: ".post-card",
          // gutter: 20,
        });
        $masonryBeauty.imagesLoaded().progress(function () {
          $masonryBeauty.masonry("layout");
        });
      } else {
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

    function initPageBtns(pageCount) {
      let $categoryPagenum = $("#category_pagenum");
      var content = '<ul>';
      for (var i=0; i<pageCount; i++) {
        if (i === 0) {
          content +=  '<li id="page_num_'+i+'" class="active"><a href="javascript:pageNumBtnClick(\'${categoryName}\', '+i+', '+pageCount+')">'+(i+1)+'</a></li>'
        } else {
          content += '<li id="page_num_'+i+'" class="pagination__page-number"><a href="javascript:pageNumBtnClick(\'${categoryName}\', '+i+', '+pageCount+')">'+(i+1)+'</a></li>'
        }
      }
      content += '</ul>';
      $categoryPagenum
        .empty()
        .prepend(content);
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