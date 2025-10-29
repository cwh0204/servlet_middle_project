package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

import com.groo.controller.AdminAvgReportController;
import com.groo.controller.AdminInsertUserController;
import com.groo.controller.AdminReportProcessUserSerchController;
import com.groo.controller.AdminReportSerchController;
import com.groo.controller.AdminSelectSearchUserController;
import com.groo.controller.AdminSelectStudyMemberController;
import com.groo.controller.AdminSelectUserAllController;
import com.groo.controller.AdminSelectUserInsertCheckController;
import com.groo.controller.AdminStatsUserController;
import com.groo.controller.AdminStudyMemberDeleteController;
import com.groo.controller.AdminUpdateUserController;
import com.groo.controller.BoardDetailSelectController;
import com.groo.controller.BoardInsertController;
import com.groo.controller.BoardLikeInsertController;
import com.groo.controller.BoardLikeSearchController;
import com.groo.controller.BoardSelectController;
import com.groo.controller.Controller;
import com.groo.controller.GitHubLoginController;
import com.groo.controller.KakaoLoginController;
import com.groo.controller.LoginController;
import com.groo.controller.MainController;
import com.groo.controller.MemberSelectController;
import com.groo.controller.MyPageController;
import com.groo.controller.NaverLoginController;
import com.groo.controller.SignUpController;
import com.groo.controller.SignUpSelectEmailController;
import com.groo.controller.SignUpSelectLoginIdController;
import com.groo.controller.TeamActivateController;
import com.groo.controller.TeamDeleteController;
import com.groo.controller.TeamDisableSelectController;
import com.groo.controller.TeamSelectController;
import com.groo.controller.TeamStatsController;
import com.groo.controller.boardController_EX;

public class FrontControllerPath {

    private Map<String, Controller> controllerMap = new HashMap<>();

    public FrontControllerPath() {
        controllerMap.put("/logins.do", new LoginController());
        controllerMap.put("/mains.do", new MainController());

        controllerMap.put("/singnups.do", new SignUpController());
        controllerMap.put("/singnupselectloginid.do", new SignUpSelectLoginIdController());
        controllerMap.put("/singnupselectemail.do", new SignUpSelectEmailController());

        //게시판
        controllerMap.put("/boardinsert.do", new BoardInsertController());
        controllerMap.put("/boardselect.do", new BoardSelectController());
        controllerMap.put("/boarddetailselect.do", new BoardDetailSelectController());

        //좋아요
        controllerMap.put("/boardlikeinsert.do", new BoardLikeInsertController());

        controllerMap.put("/boardlikesearch.do", new BoardLikeSearchController());
        

        //팀관련 API
        controllerMap.put("/teamselects.do", new TeamSelectController());
        controllerMap.put("/teamdisableselects.do", new TeamDisableSelectController());
        controllerMap.put("/teamstats.do", new TeamStatsController());
        controllerMap.put("/teamdelete.do", new TeamDeleteController());
        controllerMap.put("/teamactivate.do", new TeamActivateController());

        controllerMap.put("/mypages.do", new MyPageController());

        controllerMap.put("/mypages.do", new MyPageController());

        controllerMap.put("/selectloginid.do", new SignUpSelectLoginIdController());
        controllerMap.put("/selectemail.do", new SignUpSelectEmailController());

        controllerMap.put("/naverlogin.do", new NaverLoginController());
        controllerMap.put("/githublogin.do", new GitHubLoginController());
        controllerMap.put("/kakaologin.do", new KakaoLoginController());
        controllerMap.put("/naverlogin.do", new NaverLoginController());
        controllerMap.put("/githublogin.do", new GitHubLoginController());
        controllerMap.put("/kakaologin.do", new KakaoLoginController());

        controllerMap.put("/MemberSelectImplAPI.do", new MemberSelectController());

        //관리자 관련 API
        controllerMap.put("/adminuserselectall.do", new AdminSelectUserAllController());
        controllerMap.put("/adminuserselectcheck.do", new AdminSelectUserInsertCheckController());
        controllerMap.put("/adminuserinsert.do", new AdminInsertUserController());
        controllerMap.put("/adminupdateuser.do", new AdminUpdateUserController());
        controllerMap.put("/adminstatsuser.do", new AdminStatsUserController());
        controllerMap.put("/adminselectsearchuser.do", new AdminSelectSearchUserController());
        controllerMap.put("/adminreportserch.do", new AdminReportSerchController());
        controllerMap.put("/adminavgreport.do", new AdminAvgReportController());
        controllerMap.put("/adminreportprocessuserserch.do", new AdminReportProcessUserSerchController());
        controllerMap.put("/adminstudymemberdelete.do", new AdminStudyMemberDeleteController());

        controllerMap.put("/noticedetail.do", new boardController_EX());

        controllerMap.put("/adminselectstudymember.do", new AdminSelectStudyMemberController());
    }

    public Controller getControllers(String command) {
        return controllerMap.get(command);
    }
}
