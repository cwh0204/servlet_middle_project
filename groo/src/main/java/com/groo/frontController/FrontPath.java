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

        jspMap.put("/userdetail.do", "/WEB-INF/view/user/userdetail.jsp");
        jspMap.put("/userdetailpw.do", "/WEB-INF/view/user/userdetailpw.jsp");
        jspMap.put("/mypage.do", "/WEB-INF/view/mypage/mypage.jsp");
        jspMap.put("/mypageprofile.do","/WEB-INF/view/mypage/mypageprofile.jsp");
        jspMap.put("/mypagedashboard.do", "/WEB-INF/view/mypage/mypagedashboard/mypagedashboard.jsp");
        jspMap.put("/mypagedashboardhome.do", "/WEB-INF/view/mypage/mypagedashboard/mypagedashboardhome.jsp");
        jspMap.put("/myboard.do", "/WEB-INF/view/mypage/myboard/myboardhome.jsp");
        jspMap.put("/mycomment.do", "/WEB-INF/view/mypage/myboard/mycomment.jsp");
        jspMap.put("/mylike.do", "/WEB-INF/view/mypage/myboard/mylike.jsp");


        //관리자 경로
        jspMap.put("/admin.do", "/WEB-INF/view/admin/admin.jsp");
        jspMap.put("/admindashboard.do", "/WEB-INF/view/admin/admindashboard.jsp");
        jspMap.put("/adminuser.do", "/WEB-INF/view/admin/adminuser.jsp");
        jspMap.put("/adminuserreport.do", "/WEB-INF/view/admin/adminuserreport.jsp");
        jspMap.put("/adminteam.do", "/WEB-INF/view/admin/adminteam.jsp");
        jspMap.put("/admindisableuser.do", "/WEB-INF/view/admin/admindisableuser.jsp");
        jspMap.put("/adminuserreportprocess.do", "/WEB-INF/view/admin/adminuserreportprocess.jsp");
        jspMap.put("/admindisableteam.do", "/WEB-INF/view/admin/admindisableteam.jsp");
        jspMap.put("/adminteammember.do", "/WEB-INF/view/admin/adminteammember.jsp");
        jspMap.put("/adminnotice.do", "/WEB-INF/view/admin/adminnotice.jsp");

        //board 경로
        jspMap.put("/intro.do", "/WEB-INF/view/board/intro.jsp");
        jspMap.put("/boardlist.do", "/WEB-INF/view/board/notice/boardlist.jsp");
        jspMap.put("/boardnoticehome.do", "/WEB-INF/view/board/notice/boardnoticehome.jsp");
        jspMap.put("/boardfree.do", "/WEB-INF/view/board/free/boardfree.jsp");
        jspMap.put("/boardfreehome.do", "/WEB-INF/view/board/free/boardfreehome.jsp");
        jspMap.put("/boardnotice.do", "/WEB-INF/view/board/notice/boardnotice.jsp");
        jspMap.put("/boardteam.do", "/WEB-INF/view/board/teamboard/boardteam.jsp");
        jspMap.put("/boardteamhome.do", "/WEB-INF/view/board/team/boardteamhome.jsp");
        jspMap.put("/boardgoal.do", "/WEB-INF/view/board/goal/goalteam.jsp");
        jspMap.put("/boardgoalhome.do", "/WEB-INF/view/board/goal/boardgoalhome.jsp");
        jspMap.put("/boardwrite.do", "/WEB-INF/view/board/boardwrite.jsp");
        jspMap.put("/postdetail.do", "/WEB-INF/view/board/postdetail.jsp");
        jspMap.put("/boardedit.do", "/WEB-INF/view/board/boardedit.jsp");
        jspMap.put("/postteamdetail.do", "/WEB-INF/view/board/postteamdetail.jsp");

        //team 경로
        jspMap.put("/teamcreate.do", "/WEB-INF/view/team/teamcreate/teamcreate.jsp");
        jspMap.put("/teamcreatehome.do", "/WEB-INF/view/team/teamcreate/teamcreatehome.jsp");
        jspMap.put("/team.do", "/WEB-INF/view/team/team.jsp");
        jspMap.put("/myteamhome.do", "/WEB-INF/view/team/myteam/myteamhome.jsp");
        jspMap.put("/teamfind.do", "/WEB-INF/view/team/teamfind.jsp");
        jspMap.put("/myteam.do", "/WEB-INF/view/team/myteam.jsp");
        jspMap.put("/teamdetail.do", "/WEB-INF/view/team/teamdetail/teamdetail.jsp");
        jspMap.put("/teamdetailhome.do", "/WEB-INF/view/team/teamdetail/teamdetailhome.jsp");
        jspMap.put("/teamdetailmemlist.do", "/WEB-INF/view/team/teamdetail/teamdetailmemlist.jsp");
        jspMap.put("/teamboard.do", "/WEB-INF/view/team/teamdetail/teamboard.jsp");

        jspMap.put("/teamvote.do", "/WEB-INF/view/team/teamdetail/teamvote.jsp");
        jspMap.put("/teamschedule.do", "/WEB-INF/view/team/teamdetail/teamschedule.jsp");


    }

    public String getJspPath(String command) {
        return jspMap.get(command);
    }
}