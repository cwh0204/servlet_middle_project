package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

public class FrontPath {
    private Map<String, String> jspMap;

    public FrontPath() {
        jspMap = new HashMap<>();
        jspMap.put("/login.do", "/WEB-INF/view/user/login.jsp");
        jspMap.put("/index.do", "/WEB-INF/view/index.jsp");
        jspMap.put("/singup.do", "/WEB-INF/view/user/SignUpPage.jsp");
        jspMap.put("/teamcreate.do", "/WEB-INF/view/team/teamcreate.jsp");
        jspMap.put("/teamfind.do", "/WEB-INF/view/team/teamfind.jsp");
        jspMap.put("/userdetail.do", "/WEB-INF/view/user/userDetail.jsp");
        
        jspMap.put("/admin.do", "/WEB-INF/view/admin/admin.jsp");
        jspMap.put("/admindashboard.do", "/WEB-INF/view/admin/adminDashboard.jsp");
        jspMap.put("/adminuser.do", "/WEB-INF/view/admin/adminUser.jsp");
    }

    public String getJspPath(String command) {
        return jspMap.get(command);
    }
}