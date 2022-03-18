<#--            Main Content-->

<script>
  <#--TODO : page button action function : page=0 의 쿼리파람 값만 변경해서 날려주기 : 데이터는 그대로 가져온다.-->
  function pageNumBtnClick(categoryName, pageNum, pageCount) {
    console.log("In pageNumBtnClick - categoryName : " + categoryName + " pageNum : " + pageNum)
    changeActivePageNumBtn(pageNum, pageCount);
    getAndSetPageList(categoryName, pageNum);
  }

  function changeActivePageNumBtn(pageNum, pageCount) {
    for (var i=0; i<pageCount; i++) {
      let pageId  = '#page_num_' + i;
      let $pageBtn = $(pageId);
      if (i === pageNum) {
        $pageBtn
          .removeClass("pagination__page-number")
          .addClass("active")
      } else {
        $pageBtn
          .addClass("pagination__page-number")
          .removeClass("active")
      }

    }

  }



  <#--TODO : totalPages 수에 따라 pageButton 만들기  -->
</script>

<div class="col-12 col-md-7 col-lg-8 order-md-1">
  <div class="category__header">
    <div class="category__header__text">
      <h5>Categories:</h5><a href="/category?categoryName=${categoryName}">${categoryName}</a>
    </div>
    <div class="category__header__filter"><a class="category__header__filter__item" href="javascript:void(0)" data-layout="grid"><i class="fas fa-th"></i></a><a class="category__header__filter__item active" href="javascript:void(0)" data-layout="list"><i class="fas fa-bars"></i></a></div>
  </div>
  <div class="category_content"></div>
  <div class="pagination" id="category_pagenum">
    <#--<ul>
      <li class="active"><a href="javascript:pageNumBtnClick('${categoryName}', 0)">1</a></li>
      <li class="pagination__page-number"><a href="javascript:pageNumBtnClick('${categoryName}', 1)">2</a></li>
      <li class="pagination__page-number"><a href="javascript:pageNumBtnClick('${categoryName}', 2)">3</a></li>
      <li><a class="next" href="javascript:void(0)">></a></li>
    </ul>-->
  </div>
</div>