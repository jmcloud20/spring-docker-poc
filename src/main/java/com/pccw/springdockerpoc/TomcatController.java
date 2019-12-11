package com.pccw.springdockerpoc;

import java.util.Collection;
import java.util.function.Supplier;
import java.util.function.UnaryOperator;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TomcatController{

    public static final String CONST_BLANK = "";

    @Value("${db.uname}")
    public String dbUname;

    @Value("${db.pword}")
    public String dbPword;

    private UnaryOperator<String> propertyValueSuppler = propertyName -> {
        String value = TomcatController.CONST_BLANK;
        switch(propertyName){
            case "dbuname": value = this.dbUname; break;
            case "dbpword": value = this.dbPword; break;
            default: value = "No value for this property.";
        }
        return value;
    };

    private Supplier<Collection<String>> helloTest = () -> {
        System.out.println("This is to simulate if volume mount maven is possible.");
        return IntStream.range(0, 10)
            .mapToObj(i -> "Hello number " + i)
            .collect(Collectors.toList());
    };

    @GetMapping("/hello")
    public Collection<String> sayHello(){
        return this.helloTest.get();
    }

    @GetMapping("/properties")
    public String getProperties(@RequestParam(required = false) String propertyName){
        return this.propertyValueSuppler.apply(propertyName);       
    }

}