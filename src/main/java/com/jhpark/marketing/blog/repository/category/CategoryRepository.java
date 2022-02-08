package com.jhpark.marketing.blog.repository.category;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.payload.response.CategoryListElementResponse;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

  @Query(value =
    "SELECT " +
    " new com.jhpark.marketing.blog.payload.response.CategoryListElementResponse(c.category, COUNT(*) AS categoryCount , '')" +
    " FROM Category c " +
    " GROUP BY c.category " +
    " ORDER BY categoryCount DESC"
  )
  Slice<CategoryListElementResponse> findAllWithJPQL(Pageable pageable);

  List<Category> findAllByCategoryOrderByPostingIdDesc(String category);
}
