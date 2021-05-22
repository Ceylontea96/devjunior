package com.board.mvc.web.users.controller;

import com.board.mvc.web.users.domain.ModifyUser;
import com.board.mvc.web.users.domain.User;
import com.board.mvc.web.users.service.UserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/users")
@Log4j2
public class UserController {

    private final UserService userService;

    private static final String LOGIN_USER = "loginUser";

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    //로그인 화면 요청
    @GetMapping("/login")
    public String signIn() {
        return "/users/logIn";
        //id, pw 입력화면 호출
    }

    //로그인 정보 저장 요청
    @PostMapping("/login")
    public String signIn(User user, HttpSession session) {
        User user1 = userService.findOne(user.getUserId());
        if (user1 == null) {
            log.info("해당 유저없음!!!!!!!!!!!!!!!!");
            return "/users/login-fail";
        } else {
            if (user.getUserPw().equals(user1.getUserPw())) {
                log.info("로그인 성공" + user1);
                //로그인 성공 시 로그인한 유저 객체를 세션에 저장
                session.setAttribute(LOGIN_USER, user1);

                return "redirect:/bulletin/list";
                //로그인 성공시 게시판 메인 화면 호출
            } else {
                log.info("비번 틀림!!!!!!!!!!!!!!!");
                return "/users/login-fail";
            }
        }

    }


    //회원가입 화면 요청
    @GetMapping("/sign-up")
    public String singUp() {
        return "/users/signUp";
        //회원 정보 작성 화면 호출
    }

    //회원가입 정보 저장 요청
    @PostMapping("/sign-up")
    public String signUp(User user, Model model) {
        userService.register(user);
        model.addAttribute("user", user);
        return "/users/signUp-success";
        //성공시 회원가입 성공 화면 호출
    }

    //회원 상세정보 요청
    @GetMapping("/info")
    public String detail(String userId, Model model) {
        User user = userService.findOne(userId);
        model.addAttribute("user", user);

        return "/users/user-info";
        //회원 정보 화면 호출
    }

    //회원 정보 수정 화면 요청
    @GetMapping("/modify")
    public String modify(String userId, Model model) {
        User user = userService.findOne(userId);
        model.addAttribute("user", user);
        return "/users/modify";

    }

    //수정된 회원 정보 저장 요청
    @PostMapping("/modify")
    public String modify(String userId, ModifyUser modifyUser) {
        userService.modify(userId, modifyUser);
        return "redirect:/users/info?userId=" + userId;
    }

    //로그아웃 요청
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        User user = (User)session.getAttribute(LOGIN_USER);
        log.info("로그아웃 유저 정보"+user);
        model.addAttribute("user", user);
        session.removeAttribute(LOGIN_USER);
        return "/users/logOut";
    }

    //회원 탈퇴 요청
    @GetMapping("/withdraw")
    public String withdraw(String userId) {
        userService.delete(userId);
        return "redirect:/bulletin/list";
        //회원 탈퇴 완료시 탈퇴 완료 화면 또는 완료 메시지와 함께 메인화면 호출
    }

    // 내 정보 보기
    @GetMapping("/myinfo")
    public String myInfo(HttpSession session) {
        User user = (User)session.getAttribute(LOGIN_USER);
        return "redirect:/users/info?userId=" + user.getUserId();
    }


}
