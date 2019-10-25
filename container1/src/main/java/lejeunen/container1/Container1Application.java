package lejeunen.container1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@RestController
public class Container1Application {

	public static void main(String[] args) {
		SpringApplication.run(Container1Application.class, args);
	}

	@GetMapping("hello")
	public String hello(){
		return "Hello";
	}
	@GetMapping("hello/world")
	public String helloWorld(){
		return "Hello World";
	}
	@GetMapping("call/module2")
	public String callModule2(){
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response
				= restTemplate.getForEntity("http://container2.emasphere.svc.cluster.local:9000/hello" , String.class);

		return response.toString();
	}
}
