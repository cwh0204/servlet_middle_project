package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

public class FrontPath {
    private Map<String, String> jspMap;

    public FrontPath() {
        jspMap = new HashMap<>();
        jspMap.put("/login.do", "/WEB-INF/view/login.jsp");
        jspMap.put("/index.do", "/WEB-INF/view/index.jsp");
        jspMap.put("/singup.do", "/WEB-INF/view/SignUpPage.jsp");
        jspMap.put("/teamcreate.do", "/WEB-INF/view/teamcreate.jsp");
        jspMap.put("/teamfind.do", "/WEB-INF/view/teamfind.jsp");
        jspMap.put("/userdetail.do", "/WEB-INF/view/userDetail.jsp");
        jspMap.put("/admin.do", "/WEB-INF/view/admin.jsp");
        jspMap.put("/adminuser.do", "/WEB-INF/view/adminUser.jsp");
    }

    public String getJspPath(String command) {
        return jspMap.get(command);
    }
}