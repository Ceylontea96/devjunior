package com.board.mvc.web.board.service;

import com.board.mvc.web.board.domain.Bulletin;
import com.board.mvc.web.board.domain.ModifyBulletin;
import com.board.mvc.web.board.repository.BulletinMapper;
import com.board.mvc.web.common.paging.Criteria;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BulletinService {

    private final BulletinMapper bulletinMapper;

    // 게시글 등록하기
    public void insertArticle(Bulletin bulletin){
        bulletinMapper.insertArticle(bulletin);
    }

    // 게시글 삭제하기
    public void deleteArticle(int boardNo){
        bulletinMapper.deleteArticle(boardNo);
    }

    // 게시글 내용보기
    public Bulletin getArticleContent(int boardNo, boolean viewFlag){
        Bulletin content = bulletinMapper.getArticleContent(boardNo);
        if(viewFlag){
            bulletinMapper.viewCntUp(boardNo);
        }
        return content;
    }

    // 게시글 전체보기 - paging 처리
    public List<Bulletin> getArticles(Criteria criteria){
        return bulletinMapper.getArticles(criteria);
    }

    // 게시글 수정하기
    public void modifyArticle(ModifyBulletin modifyBulletin){
        bulletinMapper.modifyArticle(modifyBulletin);
    }

    // 조회 수 증가
    public void viewCount(int boardNo){
        bulletinMapper.viewCntUp(boardNo);
    }

    // 추천 수 증가
    public void recCntUp(int boardNo){
        bulletinMapper.recCntUp(boardNo);
    }


    // 총 게시글 수 조회
    public int getTotalCount(){
        return bulletinMapper.getTotalCount();
    }
}
