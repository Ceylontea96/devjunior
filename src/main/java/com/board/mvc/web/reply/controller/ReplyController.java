package com.board.mvc.web.reply.controller;

import com.board.mvc.web.reply.domain.ModifyReply;
import com.board.mvc.web.reply.domain.Reply;
import com.board.mvc.web.reply.service.ReplyService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reply")
@Log4j2
public class ReplyController {

    private final ReplyService replyService;

    @Autowired
    private ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }


    //댓글 저장 요청
    @PostMapping("")
    public String saveReply(Reply reply) {
        replyService.insertReply(reply);
        return "";
    }

    //댓글 수정 화면 요청
    @GetMapping("")
    public String modifyRe(int replyNo) {

        return "";
    }

    //댓글 수정 저장 요청
    @PostMapping("")
    public String modifyRe(int replyNo, ModifyReply mr) {
        replyService.changeReply(replyNo, mr);
        return "";
    }


}
