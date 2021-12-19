package com.webserver.project.model.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "bristolstool")
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class BristolStoolInfo {

    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private Long id;

    @Column(name = "color")
    private String color; // 변의 색

    @Column(name = "shape")
    private String shape; // 형태

    @Column(name = "smell")
    private String smell; // 냄새

    @Column(name = "time")
    private int time; // 볼일 본 시간

    @ManyToOne
    @JoinColumn(name = "date")
    private CalendarInfo calendarInfo; // 캘린더 날짜와 양방향 매핑

    @Builder
    public BristolStoolInfo(String color, String shape, String smell, int time) {
        this.color = color;
        this.shape = shape;
        this.smell = smell;
        this.time = time;
    } // 변 상태 객체 생성
}
