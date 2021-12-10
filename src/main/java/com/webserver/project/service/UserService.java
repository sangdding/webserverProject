package com.webserver.project.service;

import com.webserver.project.model.entity.UserInfo;
import com.webserver.project.model.dto.UserInfoDto;
import com.webserver.project.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;

    public Map<String, String> checkExistId(String id) {
        Map<String, String> errorResult = new HashMap<>();
        if(userRepository.existsByUserId(id)) {
            errorResult.put("exist_id", "이미 존재하는 id입니다!");
        }
        return errorResult;
    } // 회원가입 id 중복체크


    public Map<String, String> LoginId(String id, String password) {
        Map<String, String> errorResult = new HashMap<>();
        if(!userRepository.existsByUserId(id)) {
            errorResult.put("error", "아이디가 존재하지 않습니다.");
        } else if(userRepository.findByUserIdAndPassword(id, password) == null) {
            errorResult.put("error", "비밀번호가 존재하지 않습니다.");
        }
        return errorResult;
    }

    public UserInfoDto setUserName(UserInfoDto userInfoDto, String id, String password) {
        userInfoDto.setUserName(userRepository.findByUserIdAndPassword(id, password).getName());
        return userInfoDto;
    }

    public void save(UserInfoDto userInfoDto) {
        userRepository.save(UserInfo.builder()
                .name(userInfoDto.getUserName())
                .userId(userInfoDto.getUserId())
                .password(userInfoDto.getUserPassword()).build()
        );
    } // 회원가입 완료!
}
