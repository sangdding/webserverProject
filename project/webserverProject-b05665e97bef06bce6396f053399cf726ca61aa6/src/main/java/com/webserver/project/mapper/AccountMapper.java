package com.webserver.project.mapper;//package com.webserver.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.webserver.project.vo.Account;
import com.webserver.project.vo.Authority;
@Mapper
public interface AccountMapper {
    @Select("SELECT * FROM member WHERE id=#{id}")

    MemberEntity getMember(String id);

    @Select("SELECT* FROM member")
    List readAllUsers();
}
    Member readMember(String id);

    List<String> readAuthorites(String id);

    void insertUser(Member account);

    void insertUserAuthority(Authority authority);

    List<Member> readAllUsers();

    /*
     *  실패횟수 update
     */
    void failCntUpdate(String id);
    /*
     *  실패횟수, isEnabled 조회.
     */
    Member getFailCnt(String id);

    /*
     * 계정 활성화 여부변경, 1이었으면 0으로 0이었으면 1로 바꾼다.
     * 0은 false, 1은 true이다.
     */
    void changeEnabled(String id);

    /*
     * 실패횟수 초기화
     */
    void resetFailCnt(String id);
}