package com.softwarevax.sca.common.util;

import java.util.UUID;

public class CommonUtils {

    public static String getCode32() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
