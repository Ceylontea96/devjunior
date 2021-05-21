package com.board.mvc.web.board.controller;

import com.board.mvc.web.board.domain.Bulletin;
import com.board.mvc.web.board.domain.ModifyBulletin;
import com.board.mvc.web.board.service.BulletinService;
import com.board.mvc.web.common.paging.Criteria;
import com.board.mvc.web.common.paging.PageMaker;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/bulletin")
public class BulletinController {

    private final BulletinService bulletinService;

    @Autowired
    public BulletinController(BulletinService bulletinService){
        this.bulletinService = bulletinService;
    }

    // 게시글 등록 화면 요청
    @GetMapping("/insert")
    public String insert(){
        log.info("/bulletin/insert GET");
        return "bulletin/insert";
    }

    // 게시글 등록 처리 요청
    @PostMapping("/insert")
    public String insert(Bulletin bulletin){
        log.info("/bulletin/insert POST");
        bulletinService.insertArticle(bulletin);
        return "redirect:/bulletin/list";
    }

    // 게시물 전체 조회 - paging 처리
    @GetMapping("/list")
    public String list(Model model, Criteria criteria){
        log.info("/bulletin/list GET");
        model.addAttribute("bulletinList", bulletinService.getArticles(criteria));
        model.addAttribute("pageMaker", new PageMaker(criteria, bulletinService.getTotalCount()));
        return "bulletin/list";
    }

    // 게시글 정보 삭제 요청
    @GetMapping("/delete")
    public String delete(int boardNo){
        log.info("/bulletin/delete GET!!!");
        bulletinService.deleteArticle(boardNo);
        return "redirect:/bulletin/list";
    }

    // 게시글 세부 정보
    @GetMapping("/detail")
    public String detail(Model model, int boardNo, boolean viewFlag){
        bulletinService.viewCount(boardNo);
        Bulletin bulletin = bulletinService.getArticleContent(boardNo, viewFlag);
        model.addAttribute("bulletin", bulletin);
        return "bulletin/detail";
    }


    // 게시글 수정 화면 요청
    @GetMapping("/modify")
    public String modify(Model model, int boardNo, boolean viewFlag){
        Bulletin bulletin = bulletinService.getArticleContent(boardNo, viewFlag);
        model.addAttribute("bulletin", bulletin);
        return "bulletin/modify";
    }


    // 게시글 수정 처리 요청
    @PostMapping("/modify")
    public String modify(ModifyBulletin modifyBulletin, boolean viewFlag){
        bulletinService.modifyArticle(modifyBulletin);
        return "redirect:/bulletin/detail?boardNo="+modifyBulletin.getBoardNo()+"&viewFlag=false";
    }

    // 추천 수 증가 요청
    @GetMapping("/recommend")
    public String recommend(Model model, int boardNo, boolean viewFlag){
        bulletinService.recCntUp(boardNo);
        Bulletin bulletin = bulletinService.getArticleContent(boardNo, viewFlag);
        model.addAttribute("bulletin", bulletin);
        return "bulletin/detail";
    }



}
