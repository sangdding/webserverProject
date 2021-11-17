package com.webserver.project.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name="USERS")
@Getter
@NoArgsConstructor

public class Users {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long tableId; // users primary key

    @Column(nullable = false)
    private int id; // users id

    @Column(nullable = false)
    private String name; // users name

    @Column(nullable = false)
    private String pw; // users password
}
