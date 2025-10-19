package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

public class FrontPath {
    private Map<String, String> jspMap;

    public FrontPath() {
        jspMap = new HashMap<>();
        jspMap.put("/login.do", "/WEB-INF/view/user/login.jsp");
        jspMap.put("/main.do", "/WEB-INF/view/main/main.jsp");
        jspMap.put("/signup.do", "/WEB-INF/view/user/signupTerms.jsp");
        jspMap.put("/teamcreate.do", "/WEB-INF/view/team/teamcreate.jsp");
        jspMap.put("/teamfind.do", "/WEB-INF/view/team/teamfind.jsp");
        jspMap.put("/userdetail.do", "/WEB-INF/view/user/userDetail.jsp");
        jspMap.put("/mypage.do", "/WEB-INF/view/user/mypage.jsp");

        jspMap.put("/admin.do", "/WEB-INF/view/admin/admin.jsp");
        jspMap.put("/admindashboard.do", "/WEB-INF/view/admin/admindashboard.jsp");
        jspMap.put("/adminuser.do", "/WEB-INF/view/admin/adminuser.jsp");
        jspMap.put("/adminuserreport.do", "/WEB-INF/view/admin/adminuserreport.jsp");
        jspMap.put("/adminteam.do", "/WEB-INF/view/admin/adminteam.jsp");

    }

    public String getJspPath(String command) {
        return jspMap.get(command);
    }
}