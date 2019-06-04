package test;
 

import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;

@Component
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMyBatis {
	
}
