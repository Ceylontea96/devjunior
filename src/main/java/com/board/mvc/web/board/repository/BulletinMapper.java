package com.board.mvc.web.board.repository;

import com.board.mvc.web.board.domain.Bulletin;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BulletinMapper {
    
    // 게시글 등록하기
    void insertArticle(Bulletin bulletin);
    
    // 게시글 삭제하기
    void deleteArticle(int boardNo);

    // 게시글 전체보기
    List<Bulletin> getArticles();

    // 게시글 내용보기
    Bulletin getArticleContent(int boardNo);

    // 게시글 수정하기
    void modifyArticle(Bulletin bulletin);
    
    // 조회 수
    void viewCntUp(int boardNo);

    // 총 게시글 수 조회
    int getCount();

    // 게시글 검색

}
