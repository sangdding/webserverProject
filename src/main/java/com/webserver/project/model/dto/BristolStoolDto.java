package com.webserver.project.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Getter
@Setter
public class BristolStoolDto {

    @NotNull
    private String color;
    @NotNull
    private String shape;
    @NotNull
    private String smell;
    @NotNull
    private int time;
}
