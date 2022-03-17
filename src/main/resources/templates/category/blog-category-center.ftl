<#--            Main Content-->

<script>
  <#--TODO : page button action function : page=0 의 쿼리파람 값만 변경해서 날려주기 : 데이터는 그대로 가져온다.-->

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
  <div class="pagination">
    <ul>
      <li class="active"><a href="javascript:void(0)">1</a></li>
      <li class="pagination__page-number"><a href="javascript:void(0)">2</a></li>
      <li class="pagination__page-number"><a href="javascript:void(0)">3</a></li>
      <li><a class="next" href="javascript:void(0)">></a></li>
    </ul>
  </div>
</div>