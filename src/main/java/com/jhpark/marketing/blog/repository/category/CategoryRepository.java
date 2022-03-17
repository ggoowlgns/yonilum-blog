package com.jhpark.marketing.blog.repository.category;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import com.jhpark.marketing.blog.payload.response.CategoryWithUrlElement;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

  @Query(value =
    "SELECT " +
    " new com.jhpark.marketing.blog.payload.response.CategoryListElementResponse(c.category, COUNT(*) AS categoryCount , '')" +
    " FROM Category c " +
    " GROUP BY c.category " +
    " ORDER BY categoryCount DESC"
  )
  Slice<CategoryListElementResponse> getTopCategoriesWithJPQL(Pageable pageable);

  @Query(value =
  "SELECT new com.jhpark.marketing.blog.payload.response.CategoryWithUrlElement(c.category, c.categoryImageUrl)" +
  " FROM Category c " +
  " WHERE category IN (:categories) AND c.categoryImageUrl IS NOT NULL")
  List<CategoryWithUrlElement> getCategoryImageUrlByCategoryName(@Param("categories") List<String> categories);

  List<Category> findAllByCategoryOrderByPostingIdDesc(String category);
}
