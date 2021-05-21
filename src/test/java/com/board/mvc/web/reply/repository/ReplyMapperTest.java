package com.board.mvc.web.reply.repository;

import com.board.mvc.web.reply.domain.ModifyReply;
import com.board.mvc.web.reply.domain.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyMapperTest {

    @Autowired
    private ReplyMapper replyMapper;

    //저장
    @Test
    @DisplayName("댓글이 DB에 정상적으로 저장되어야 한다.")
    void saveTest() {
        Reply reply = new Reply();
        reply.setBoardNo(321);
        reply.setWriter("aa");
        reply.setContent("asdfsadfsda");

        replyMapper.saveReply(reply);
    }

    //삭제
    @Test
    @DisplayName("댓글이 db에서 정상적으로 제거되어야 한다.")
    void deleteTest() {
        replyMapper.deleteReply(1);
    }

    //수정
    @Test
    @DisplayName("댓글의 변경된 내용이 정상적으로 DB에 저장되어야 한다.")
    void changeTest() {
        ModifyReply modifyReply = new ModifyReply();
        modifyReply.setReplyNo(2);
        modifyReply.setWriter("aa");
        modifyReply.setContent("11111111111");

        replyMapper.changeReply(modifyReply);
    }

    //조회
    @Test
    @DisplayName("전체 댓글이 정상적으로 조회되어야 한다.")
    void findReplyTest() {
        List<Reply> replys = replyMapper.findAllReply();
        System.out.println("=========================================");
        for (Reply r : replys) {
            System.out.println(r);
        }
    }

    @Test
    @DisplayName("특정 댓글이 정상적으로 조회되어야 한다.")
    void findOneReplyTest() {
        Reply reply = replyMapper.findOneReply(3);
        System.out.println("해당 댓글" + reply);
    }
}