package com.jhpark.marketing.blog.repository.posting;

import com.jhpark.marketing.blog.entity.Posting;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostingRepository extends JpaRepository<Posting, Long> {
  List<Posting> findAllByOrderByPostingIdDesc();
  Page<Posting> findAllByOrderByPostingIdDesc(Pageable pageable);
  Slice<Posting> findAllByOrderByCreatedDatetimeDesc(Pageable pageable);
  Slice<Posting> findAllByPostingIdIsLessThanOrderByCreatedDatetimeDesc(long postingId, Pageable pageable);

  Slice<Posting> findAllByOrderByViewsDesc(Pageable pageable);
  Posting findPostingByPostingId(long postingId);

}
