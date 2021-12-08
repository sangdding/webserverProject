package com.webserver.project.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity
@Table(name= "calendar")
@Builder
@NoArgsConstructor
//@AllArgsConstructor
public class CalendarInfo {
    @Id
    @NotBlank
    private int calDate; //달력 PK ==날짜

    @NotBlank
    @JoinColumn(name = "userId")
    private String userId; // 사용자 id

    @Column(name = "diet")
    private String diet; // 그날 식단

    @Column(name = "bm")
    private String bm; // 그날 배변 상황

    @Builder
    public CalendarInfo(int calDate,String bm, String diet, String userId ){
        this.calDate=calDate;
        this.userId=userId;
        this.diet = diet;
        this.bm = bm;
    } // 달력 객체 생성
}
