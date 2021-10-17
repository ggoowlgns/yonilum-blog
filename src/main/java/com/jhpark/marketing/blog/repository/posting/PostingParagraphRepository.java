package com.jhpark.marketing.blog.repository.posting;

import com.jhpark.marketing.blog.entity.PostingContentParagraph;
import com.jhpark.marketing.blog.entity.PostingImage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostingParagraphRepository extends JpaRepository<PostingContentParagraph, Long> {
}
