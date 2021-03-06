package com.webserver.project.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name= "user")
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //사용자 PK

    @Column(name = "name")
    private String name; // 사용자 이름

    @Column(name = "userid")
    private String userId; // 사용자 id

    @Column(name = "password")
    private String password; // 사용자 비밀번호

    @OneToOne(mappedBy = "userInfo")
    private CalendarInfo calendarInfo; // 캘린더와 일대일 매핑

    @Builder
    public UserInfo(String name, String id, String password) {
        this.name = name;
        this.userId = id;
        this.password = password;
    } // 사용자 객체 생성
}
