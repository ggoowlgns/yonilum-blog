package com.jhpark.marketing.blog.repository.posting;

import com.jhpark.marketing.blog.entity.Posting;
import com.jhpark.marketing.blog.entity.PostingImage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostingImagesRepository extends JpaRepository<PostingImage, Long> {
}
