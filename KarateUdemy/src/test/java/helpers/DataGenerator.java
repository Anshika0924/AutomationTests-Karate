package helpers;

import com.github.javafaker.Faker;

import java.util.Locale;

public class DataGenerator {
    public static String GetRandomEmail() {
        Faker faker=new Faker();
        String email=faker.name().firstName().toLowerCase() + faker.random().nextInt(0,100)+ "@test.com";
        return email;
    }

    public static String GetRandomUserName(){
        Faker faker=new Faker();
        String username=faker.name().username();
        return username;
    }


//    For non static functions how to make instance of class
    public String GetRandomUserName2(){
        Faker faker=new Faker();
        String username=faker.name().username();
        return username;
    }
}
