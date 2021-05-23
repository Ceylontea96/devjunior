package com.board.mvc.web.reply.controller;

import com.board.mvc.web.reply.domain.Reply;
import com.board.mvc.web.reply.service.ReplyService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequestMapping("/reply")
public class ReplyController {

    private ReplyService replyService;

    @Autowired
    public ReplyController(ReplyService replyService){
        this.replyService = replyService;
    }

    // 댓글 정보 삭제 요청
    @GetMapping("/delete")
    public String delete(int replyNo, int boardNo){
        log.info("/reply/delete GET!!!");
        replyService.deleteReply(replyNo);
        return "redirect:/bulletin/detail?boardNo="+boardNo+"&viewFlag=false";
    }

    // 댓글 등록 처리 요청
    @PostMapping("/insert")
    public String insert(Reply reply){
        log.info("/reply/insert POST - " + reply);
        replyService.saveReply(reply);
        return "redirect:/bulletin/detail?boardNo="+reply.getBoardNo()+"&viewFlag=false";
    }


    // 댓글 수정 처리 요청
    @GetMapping("/modify")
    public String modify(Reply reply){
        log.info("/reply/modify POST -" + reply);
        replyService.changeReply(reply);
        return "redirect:/bulletin/detail?boardNo="+reply.getReplyNo()+"&viewFlag=false";
    }



}
