package newT;

import java.util.Properties;

public class Encode {

    public static void main(String[] args) {
        Properties properties = new Properties(System.getProperties());
        System.out.println("当前系统编码:" + properties.getProperty("file.encoding"));
        System.out.println("当前系统语言:" + properties.getProperty("user.language"));

    }
}
