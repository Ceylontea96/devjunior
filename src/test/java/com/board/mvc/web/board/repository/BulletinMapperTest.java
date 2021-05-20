package com.board.mvc.web.board.repository;

import com.board.mvc.web.board.domain.Bulletin;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BulletinMapperTest {

    @Autowired BulletinMapper bulletinMapper;
    @Test
    void insertTest(){
        Bulletin bulletin = new Bulletin();
        bulletin.setWriter("aa");
        bulletin.setContent("dd");
        bulletin.setTitle("aa");
        bulletinMapper.insertArticle(bulletin);
    }
}