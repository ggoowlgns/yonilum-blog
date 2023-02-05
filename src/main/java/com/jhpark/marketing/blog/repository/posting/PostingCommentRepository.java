package com.jhpark.marketing.blog.repository.posting;

import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.entity.PostingComment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostingCommentRepository extends JpaRepository<PostingComment, Long> {
}
