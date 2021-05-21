package com.board.mvc.web.reply.service;

import com.board.mvc.web.reply.domain.ModifyReply;
import com.board.mvc.web.reply.domain.Reply;
import com.board.mvc.web.reply.repository.ReplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReplyService {

    private ReplyMapper replyMapper;

    //댓글 등록
    public void insertReply(Reply reply) {
        replyMapper.saveReply(reply);
    }

    //댓글 삭제
    public void deleteReply(int replyNO) {
        replyMapper.deleteReply(replyNO);
    }

    //댓글 수정
    public void changeReply(int replyNo, ModifyReply modifyReply) {
        modifyReply.setReplyNo(replyNo);
        replyMapper.changeReply(modifyReply);
    }

    //단일 댓글 조회
    public Reply findReply(int replyNo) {
        return replyMapper.findOneReply(replyNo);
    }

    //댓글 목록 조회
    public List<Reply> findAll() {
        return replyMapper.findAllReply();
    }


}
