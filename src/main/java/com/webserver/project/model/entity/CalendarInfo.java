package com.webserver.project.model.entity;

import lombok.*;
import org.apache.catalina.User;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name= "calendar")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CalendarInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "calendar_id")
    private Long id; // 달력 PK

    @Column(name = "date")
    private String calDate; //달력 FK ==날짜

    @OneToMany(mappedBy = "calendarInfo")
    private List<BristolStoolInfo> bristolStoolInfos = new ArrayList<BristolStoolInfo>(); // 똥 상태와 양방향 매핑

    @OneToMany(mappedBy = "calendarInfo")
    private List<dietInfo> dietInfos = new ArrayList<dietInfo>(); // 똥 상태와 양방향 매핑

    @OneToOne
    @JoinColumn(name = "user_id")
    private UserInfo userInfo; // 유저와 일대일 매핑

    public void setUser(UserInfo userinfo) {
        this.userInfo = userinfo;
    }

    @Builder
    public CalendarInfo(String calDate){
        this.calDate=calDate;
    } // 달력 객체 생성

}
