package com.jhpark.marketing.blog.repository.posting;

import com.jhpark.marketing.blog.entity.Category;
import com.jhpark.marketing.blog.entity.Posting;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostingRepository extends JpaRepository<Posting, Long> {
  List<Posting> findAll();
  List<Posting> findAllByOrderByViewsDesc(Pageable pageable);
  Posting findPostingByPostingId(long postingId);
}
