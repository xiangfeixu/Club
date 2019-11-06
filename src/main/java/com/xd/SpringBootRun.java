package com.xd;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan("com.xd.mapper")
@SpringBootApplication
public class SpringBootRun {
public static void main(String[] args) {
	SpringApplication.run(SpringBootRun.class);
}
}
