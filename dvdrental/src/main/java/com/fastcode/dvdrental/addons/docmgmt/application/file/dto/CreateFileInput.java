package com.fastcode.dvdrental.addons.docmgmt.application.file.dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateFileInput {

    private String label;
    private String name;
    private String summary;
    private String versiono;
    private Date created;
}
