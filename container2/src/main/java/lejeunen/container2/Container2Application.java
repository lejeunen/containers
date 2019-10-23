package lejeunen.container2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Container2Application {

	public static void main(String[] args) {
		SpringApplication.run(Container2Application.class, args);
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
