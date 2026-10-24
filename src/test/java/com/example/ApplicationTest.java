package com.example;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

public class ApplicationTest {

    @Test
    void getTimezoneInfo() {
        Application.printOsVersion();

        String result = Application.getTimezoneInfo();
        assertNotNull(result);

        System.out.println("Timezone in " + this.getClass() + " is: " + result);
    }

}
