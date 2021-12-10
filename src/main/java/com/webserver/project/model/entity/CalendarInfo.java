package com.webserver.project.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import org.apache.catalina.User;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name= "calendar")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CalendarInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "calendar_id")
    private Long id; // 달력 PK

    @Column(name = "date")
    private String calDate; //달력 FK ==날짜

    @Column(name = "diet")
    private String diet; // 그날 식단

    @Column(name = "bm")
    private String bm; // 그날 배변 상황

    @OneToMany(mappedBy = "calendarInfo")
    private List<BristolStoolInfo> bristolStoolInfos = new ArrayList<>(); // 똥 상태와 양방향 매핑

    @OneToOne
    @JoinColumn(name = "user_id")
    private UserInfo userInfo; // 유저와 일대일 매핑

    @Builder
    public CalendarInfo(String calDate, String diet, String bm){
        this.calDate=calDate;
        this.diet = diet;
        this.bm = bm;
    } // 달력 객체 생성

}
