package com.webserver.project.dto;

import com.webserver.project.domain.entity.MemberEntity;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MemberDto {
    private Long tableId;
    private String id;
    private String name;
    private String password;
    private LocalDateTime createdDate;
    private LocalDateTime modifiedDate;

    public MemberEntity toEntity(){
        return MemberEntity.builder()
                .tableId(tableId)
                .id(id)
                .name(name)
                .password(password)
                .build();
    }

    @Builder
    public MemberDto(Long tableId, String id, String pw, String name) {
        this.tableId = tableId;
        this.id = id;
        this.name=name;
        this.password = password;
    }
}
