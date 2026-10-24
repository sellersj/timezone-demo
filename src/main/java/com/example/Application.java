package com.example;

import java.time.zone.ZoneRulesProvider;

public class Application {

    public static void main(String[] args) {
        System.out.println("Java version: " + Runtime.version());
        System.out.println("Timezone file is " + getTimezoneInfo());
    }

    public static String getTimezoneInfo() {
        return ZoneRulesProvider.getVersions("UTC").lastEntry().getKey();
    }

}
