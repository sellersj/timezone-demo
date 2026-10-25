package com.example;

import java.time.zone.ZoneRulesProvider;

public class Application {

    public static void main(String[] args) {
        printOsVersion();
        System.out.println("Timezone file is " + getTimezoneInfo());
    }

    public static String getTimezoneInfo() {
        return ZoneRulesProvider.getVersions("UTC").lastEntry().getKey();
    }

    public static void printOsVersion() {
        String osName = System.getProperty("os.name");
        String osVersion = System.getProperty("os.version");
        String osArch = System.getProperty("os.arch");
        String vendor = System.getProperty("java.vendor");

        System.out.println("OS Name: " + osName);
        System.out.println("OS Version: " + osVersion);
        System.out.println("OS Architecture: " + osArch);
        System.out.println("Java version: " + System.getProperty("java.version"));
        System.out.println("Java Vendor: " + vendor);
    }

}
