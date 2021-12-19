package com.webserver.project.model.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "diet")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class dietInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Long Id;

    @Column(name = "diet")
    private String diet;

    @ManyToOne
    @JoinColumn(name = "date")
    private CalendarInfo calendarInfo; // 캘린더 날짜와 양방향 매핑

}
