package com.webserver.project.model;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Getter
@Setter
public class UserInfoDto {

    @NotBlank(message = "아이디를 입력해주세요.")
    private String userId;
    @NotBlank(message="이름을 입력해주세요.")
    private String userName;
    @NotBlank(message="비밀번호를 입력해주세요.")
    @Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*\\W)(?=\\S+$).{6,12}",
            message = "비밀번호는 영문자와 숫자, 특수기호가 적어도 1개 이상 포함된 6자~12자의 비밀번호여야 합니다.")
    private String userPassword;
}
