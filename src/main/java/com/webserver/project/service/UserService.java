package com.webserver.project.service;

import com.webserver.project.model.entity.UserInfo;
import com.webserver.project.model.dto.UserInfoDto;
import com.webserver.project.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
        String encrypted = encryptSHA256(password);
        if(!userRepository.existsByUserId(id)) {
            errorResult.put("error", "아이디가 존재하지 않습니다.");
        } else if(userRepository.findByUserIdAndPassword(id, encrypted) == null) {
            errorResult.put("error", "비밀번호가 존재하지 않습니다.");
        }
        return errorResult;
    }

    public UserInfoDto setUserName(UserInfoDto userInfoDto, String id, String password) {
        String encrypted = encryptSHA256(password);
        userInfoDto.setUserName(userRepository.findByUserIdAndPassword(id, encrypted).getName());
        return userInfoDto;
    }

    public String encryptSHA256(String password) {
        String sha = "";
        try {
            MessageDigest sh = MessageDigest.getInstance("SHA-256");
            sh.update(password.getBytes());
            byte[] byteData = sh.digest();
            StringBuilder sb = new StringBuilder();
            for (byte byteDatum : byteData) {
                sb.append(Integer.toString((byteDatum & 0xff) + 0x100, 16).substring(1));
            }
            sha = sb.toString();
        } catch(NoSuchAlgorithmException e) {
            System.out.println("Encrypt Error - NoSuchAlgorithmException");
        }
        return sha;
    }

    public void save(UserInfoDto userInfoDto) {
        userRepository.save(UserInfo.builder()
                .name(userInfoDto.getUserName())
                .userId(userInfoDto.getUserId())
                .password(encryptSHA256(userInfoDto.getUserPassword())).build()
        );
    } // 회원가입 완료!
}
