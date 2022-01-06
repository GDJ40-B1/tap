package com.btf.tap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling // 스케줄러 사용을 위한 어노테이션
@ServletComponentScan // filter를 위한 어노테이션
@SpringBootApplication
public class TapApplication {

	public static void main(String[] args) {
		SpringApplication.run(TapApplication.class, args);
	}

}
