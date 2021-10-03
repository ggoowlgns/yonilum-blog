package com.jhpark.marketing.blog.repository.posting;

import com.jhpark.marketing.blog.entity.Posting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostingRepository extends JpaRepository<Posting, Long> {
  List<Posting> findAll();
  Posting findPostingByPostingId(long postingId);
}
