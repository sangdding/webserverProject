package com.webserver.project.service;

import com.webserver.project.model.UserInfo;
import com.webserver.project.model.UserInfoDto;
import com.webserver.project.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;

    public Map<String, String> checkExsistId(String id) {
        Map<String, String> errorResult = new HashMap<>();
        if(userRepository.existsByUserId(id)) {
            errorResult.put("exist_id", "이미 존재하는 id입니다!");
        }
        return errorResult;
    } // 회원가입 id 중복체크


    public Map<String, String> LoginId(String id, String password, UserInfoDto userInfoDto) {
        Map<String, String> errorResult = new HashMap<>();
        if(userRepository.findByUserId(id).isEmpty()) {
            errorResult.put("non_id", "id가 존재하지 않습니다!");
        } else if(userRepository.findByPassword(password).isEmpty()) {
            errorResult.put("mismatch_password", "비밀번호가 다릅니다!");
        } else {
            userInfoDto.setUserName(userRepository.findNameByUserId(id));
        }
        return errorResult;
    }

    public void save(UserInfoDto userInfoDto) {
        System.out.println(userInfoDto.getUserId());
        userRepository.save(UserInfo.builder()
                .name(userInfoDto.getUserName())
                .userId(userInfoDto.getUserId())
                .password(userInfoDto.getUserPassword()).build()
        );
    } // 회원가입 완료!
}
