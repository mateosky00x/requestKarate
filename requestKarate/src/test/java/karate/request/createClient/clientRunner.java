package karate.request.createClient;

import com.intuit.karate.junit5.Karate;

public class clientRunner {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/createClient/client.feature").relativeTo(getClass());
    }
}
