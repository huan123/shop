package edu.test.tool;

import java.util.Random;

/**
 * Created by huan on 2015/7/21 0021.
 */
public class Tool {
    public static  String getId(int length){
        String fatherString = "afjaskljwoieurlwngkfiuparewjrj230948205j3245237489234HUAWABJGHWYEBVNCLKSDJKJWYEUIWQHRKJKJFASHDNKML";

        Random ran = new Random();

        StringBuffer sb = new StringBuffer();
        for(int i = 1; i <= length; i++){
            int index = ran.nextInt(fatherString.length());

            char ch = fatherString.charAt(index);
            sb.append(ch);
        }

        return sb.toString();
    }
}
