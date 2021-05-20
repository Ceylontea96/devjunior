package com.board.mvc.web.board.controller;

import com.board.mvc.web.board.domain.Bulletin;
import com.board.mvc.web.board.service.BulletinService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Log4j2
public class BulletinController {

    private final BulletinService bulletinService;

    @Autowired
    public BulletinController(BulletinService bulletinService){
        this.bulletinService = bulletinService;
    }

    // 게시글 등록 화면 요청
    @GetMapping("/bulletin/insert")
    public String insert(){
        log.info("/board/register GET");
        return "bulletin/insert";
    }

    // 게시글 등록 처리 요청
    @PostMapping("/bulletin/insert")
    public String insert(Bulletin bulletin){
        log.info("/board/register POST");
        bulletinService.insertArticle(bulletin);
        return "redirect:/bulletin/list";
    }

    // 게시물 전체 조회
    @GetMapping("/bulletin/list")
    public String list(Model model){
        log.info("/board/list GET");
        model.addAttribute("bulletinList", bulletinService.getArticles());
        model.addAttribute("count", bulletinService.getCount());
        return "bulletin/list";
    }

    // 게시글 정보 삭제 요청
    // 게시글 세부 정보
    // 게시글 수정 화면 요청
    // 게시글 수정 처리 요청




}
