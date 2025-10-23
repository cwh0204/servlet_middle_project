package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

public class FrontPath {
    private Map<String, String> jspMap;

    public FrontPath() {
        jspMap = new HashMap<>();
        jspMap.put("/login.do", "/WEB-INF/view/user/login.jsp");
        jspMap.put("/main.do", "/WEB-INF/view/main/main.jsp");
        jspMap.put("/mainhome.do", "/WEB-INF/view/main/mainhome.jsp");

        jspMap.put("/signup.do", "/WEB-INF/view/user/signupterms.jsp");
        jspMap.put("/signuppage.do", "/WEB-INF/view/user/signuppage.jsp");
        jspMap.put("/signupsuccess.do", "/WEB-INF/view/user/signupsuccess.jsp");
        jspMap.put("/teamcreate.do", "/WEB-INF/view/team/teamcreate.jsp");
        jspMap.put("/teamfind.do", "/WEB-INF/view/team/teamfind.jsp");
        jspMap.put("/userdetail.do", "/WEB-INF/view/user/userdetail.jsp");
        jspMap.put("/userdetailpw.do", "/WEB-INF/view/user/userdetailpw.jsp");
        

        jspMap.put("/mypage.do", "/WEB-INF/view/mypage/mypage.jsp");
        jspMap.put("/mypageprofile.do","/WEB-INF/view/mypage/mypageprofile.jsp");
        jspMap.put("/mypagedashboard.do", "/WEB-INF/view/mypage/mypagedashboard.jsp");


        jspMap.put("/admin.do", "/WEB-INF/view/admin/admin.jsp");
        jspMap.put("/admindashboard.do", "/WEB-INF/view/admin/admindashboard.jsp");
        jspMap.put("/adminuser.do", "/WEB-INF/view/admin/adminuser.jsp");
        jspMap.put("/adminuserreport.do", "/WEB-INF/view/admin/adminuserreport.jsp");
        jspMap.put("/adminteam.do", "/WEB-INF/view/admin/adminteam.jsp");
        
        jspMap.put("/boardlist.do", "/WEB-INF/view/board/boardlist.jsp");
        jspMap.put("/boardlisthome.do", "/WEB-INF/view/board/boardlisthome.jsp");
        jspMap.put("/boardfreehome.do", "/WEB-INF/view/board/boardfreehome.jsp");
        jspMap.put("/boardnoticehome.do", "/WEB-INF/view/board/boardnoticehome.jsp");
      

    }

    public String getJspPath(String command) {
        return jspMap.get(command);
    }
}