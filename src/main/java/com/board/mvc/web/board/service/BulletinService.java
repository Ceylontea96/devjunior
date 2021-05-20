package com.board.mvc.web.board.service;

import com.board.mvc.web.board.domain.Bulletin;
import com.board.mvc.web.board.repository.BulletinMapper;
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

    // 게시글 전체보기
    public List<Bulletin> getArticles(){
        List<Bulletin> temp = bulletinMapper.getArticles();
        List<Bulletin> bulletinList = new ArrayList<>();
        for (int i=temp.size()-1; i>=0; i--){
            Bulletin bulletin = temp.get(i);
            bulletinList.add(bulletin);
        }
        return bulletinList;
    }

    // 게시글 수정하기
    public void modifyArticle(Bulletin bulletin){
        bulletinMapper.modifyArticle(bulletin);
    }

    // 조회 수
    public int getCount(){
        return bulletinMapper.getCount();
    }

    // 총 게시글 수 조회

}
