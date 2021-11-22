package com.webserver.project.domain.entity;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Entity
@Table(name = "member")
public class MemberEntity {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long tableId;

    @Column(length = 20, nullable = false)
    private String id;

    @Column(length = 100, nullable = false)
    private String name;

    @Column(length = 100, nullable = false)
    private String password;

    @Builder
    public MemberEntity(Long tableId, String id,String name, String password) {
        this.tableId=tableId;
        this.id = id;
        this.name=name;
        this.password = password;
    }
}