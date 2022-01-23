package com.jhpark.marketing.blog.repository.category;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

  @Query(value =
    "SELECT " +
    " new com.jhpark.marketing.blog.payload.response.CategoryListElementResponse(c.category, COUNT(*), '')" +
    " FROM Category c " +
    " GROUP BY c.category "
  )
  List<CategoryListElementResponse> findGroupByCategoryOrderByCategoryCountWithJPQL();

  //TODO : get postings by category
  List<Category> findAllByCategoryOrderByCategoryDesc(String category);
}
