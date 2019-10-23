package lejeunen.container3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Container3Application {

	public static void main(String[] args) {
		SpringApplication.run(Container3Application.class, args);
	}

	@GetMapping("hello")
	public String hello(){
		return "Hello";
	}
	@GetMapping("hello/world")
	public String helloWorld(){
		return "Hello World";
	}
}
