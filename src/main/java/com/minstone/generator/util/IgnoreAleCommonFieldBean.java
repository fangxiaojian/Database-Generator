package com.minstone.generator.util;

import com.intellij.database.model.DasColumn;

/**
 * @author 小贱
 * @create 2021-11-22 21:14
 */
public class IgnoreAleCommonFieldBean {

    private static final String[] IGNORES = {"ID", "CODE", "VERSION", "VALID", "CREATE_MAN", "UPDATE_MAN", "CREATE_MAN_NAME", "UPDATE_MAN_NAME", "CREATE_TIME", "UPDATE_TIME", "APPLICATION_CODE"};

    public static boolean isSelectDefault (DasColumn dbColumn){
        String name = dbColumn.getName();
        boolean isSelect = true;
        for (String ignore : IGNORES) {
            if (name.equals(ignore)) {
                isSelect = false;
                break;
            }
        }
        return isSelect;
    }

}
