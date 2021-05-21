package com.board.mvc.web.users.service;

import com.board.mvc.web.users.domain.ModifyUser;
import com.board.mvc.web.users.domain.User;
import com.board.mvc.web.users.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    // 회원 정보 저장 기능
    public void register(User user) {
        userMapper.register(user);
    }

    // 회원 정보 삭제 기능
    public void delete(String userId) {userMapper.withdraw(userId);}

    // 단일 회원 정보 조회 기능
    public User findOne(String userId) {
        return userMapper.findOneUser(userId);
    }

    // 모든 회원 정보 조회 기능
    public List<User> findAll() {
        return userMapper.findAllUser();
    }

    // 회원 정보 수정 기능
    public void modify(String userId, ModifyUser modifyUser) {
        modifyUser.setUserId(userId);//회원 아이디는 PK라 변경 못하게하고 기존 아이디를 이어받도록 함.
        userMapper.changeUser(modifyUser);
    }

}