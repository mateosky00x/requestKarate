package karate.request.loginUser;

import com.intuit.karate.junit5.Karate;

public class loginUserRunner {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/loginUser/loginUser.feature").relativeTo(getClass());
    }
}
