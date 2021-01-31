package com.fastcode.dvdrental;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = { "com.fastcode.dvdrental", "org.springframework.versions" })
public class DvdrentalApplication {

    public static void main(String[] args) {
        SpringApplication.run(DvdrentalApplication.class, args);
    }
}
