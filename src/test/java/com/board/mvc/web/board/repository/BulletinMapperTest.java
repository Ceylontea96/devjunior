package com.board.mvc.web.board.repository;

import com.board.mvc.web.board.domain.Bulletin;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BulletinMapperTest {

    @Autowired BulletinMapper bulletinMapper;
    @Test
    void insertTest(){
        Bulletin bulletin = new Bulletin();
        bulletin.setWriter("aa");
        bulletin.setTitle("제목3");
        bulletin.setContent("내용3");
        bulletinMapper.insertArticle(bulletin);
    }

    @Test
    void deleteArticle(){
        bulletinMapper.deleteArticle(21);
    }

    @Test
    void getArticle(){
        List<Bulletin> list = bulletinMapper.getArticles();
        for (Bulletin bulletin : list) {
            System.out.println(bulletin);
        }
    }


}