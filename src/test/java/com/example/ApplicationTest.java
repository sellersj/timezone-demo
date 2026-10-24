package com.example;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

public class ApplicationTest {

    @Test
    void getTimezoneInfo() {
        String result = Application.getTimezoneInfo();
        assertNotNull(result);
    }

}
