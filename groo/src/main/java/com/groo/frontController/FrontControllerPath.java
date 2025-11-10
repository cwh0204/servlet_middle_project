package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

import com.groo.controller.AdminAvgBoardController;
import com.groo.controller.AdminAvgReportController;
import com.groo.controller.AdminDeleteBoardController;
import com.groo.controller.AdminInsertUserController;
import com.groo.controller.AdminReportProcessUserSerchController;
import com.groo.controller.AdminReportSerchController;
import com.groo.controller.AdminSelectBoardController;
import com.groo.controller.AdminSelectDisableStudyMemberController;
import com.groo.controller.AdminSelectSearchUserController;
import com.groo.controller.AdminSelectStudyMemberController;
import com.groo.controller.AdminSelectUserAllController;
import com.groo.controller.AdminSelectUserInsertCheckController;
import com.groo.controller.AdminStatsUserController;
import com.groo.controller.AdminStudyMemberDeleteController;
import com.groo.controller.AdminUpdateReportController;
import com.groo.controller.AdminUpdateStudyMemberActivateController;
import com.groo.controller.AdminUpdateStudyRollController;
import com.groo.controller.AdminUpdateUserController;
import com.groo.controller.BoardDeleteController;
import com.groo.controller.BoardDetailSelectController;
import com.groo.controller.BoardInsertController;
import com.groo.controller.BoardLikeInsertController;
import com.groo.controller.BoardLikeSearchController;
import com.groo.controller.BoardRankInsertController;
import com.groo.controller.BoardSelectController;
import com.groo.controller.BoardUpdateController;
import com.groo.controller.ComentDeleteController;
import com.groo.controller.ComentEditController;
import com.groo.controller.ComentInsertController;
import com.groo.controller.ComentSelectController;
import com.groo.controller.Controller;
import com.groo.controller.GitHubLoginController;
import com.groo.controller.GoogleGenaiController;
import com.groo.controller.GrooBotSelectController;
import com.groo.controller.KakaoLoginController;
import com.groo.controller.MainController;
import com.groo.controller.MemberDeleteController;
import com.groo.controller.MemberLoginController;
import com.groo.controller.MemberLogoutController;
import com.groo.controller.MemberSelectFindLoginIdController;
import com.groo.controller.MemberSelectFindPassController;
import com.groo.controller.MemberSelectPassController;
import com.groo.controller.MemberUpdateController;
import com.groo.controller.MyBoardListController;
import com.groo.controller.MyCommentListController;
import com.groo.controller.MyLikeListController;
import com.groo.controller.MyVoteListController;
import com.groo.controller.NaverLoginController;
import com.groo.controller.ReportInsertController;
import com.groo.controller.SignUpController;
import com.groo.controller.SignUpSelectEmailController;
import com.groo.controller.SignUpSelectLoginIdController;
import com.groo.controller.TeamActivateController;
import com.groo.controller.TeamDeleteController;
import com.groo.controller.TeamDisableSelectController;
import com.groo.controller.TeamInsertController;
import com.groo.controller.TeamLikeUpdateController;
import com.groo.controller.TeamMemberDeletePageController;
import com.groo.controller.TeamMemberInsertPageController;
import com.groo.controller.TeamMemberKickController;
import com.groo.controller.TeamMemberLeaderChangeController;
import com.groo.controller.TeamMemberLeaderSelectController;
import com.groo.controller.TeamMemberLeaderTeamPageSelectController;
import com.groo.controller.TeamMemberSelectController;
import com.groo.controller.TeamMemberSelectPageController;
import com.groo.controller.TeamMemberUpdatePageController;
import com.groo.controller.TeamPassSelectController;
import com.groo.controller.TeamSeclectAllController;
import com.groo.controller.TeamSelectController;
import com.groo.controller.TeamSelectMyTeamController;
import com.groo.controller.TeamStatsController;
import com.groo.controller.UserdetailSelectEmailController;
import com.groo.controller.UserdetailSelectNicknameController;
import com.groo.controller.UserdetailSelectUserDeleteController;
import com.groo.controller.UserdetailSelectUserListController;
import com.groo.controller.VoteInsertController;
import com.groo.controller.VoteSelectController;
import com.groo.controller.VoteSelectRankController;
import com.groo.controller.VoteUpdateOkController;


public class FrontControllerPath {

    private Map<String, Controller> controllerMap = new HashMap<>();

    public FrontControllerPath() {


        controllerMap.put("/mains.do", new MainController());

        controllerMap.put("/singnups.do", new SignUpController());
        controllerMap.put("/singnupselectloginid.do", new SignUpSelectLoginIdController());
        controllerMap.put("/singnupselectemail.do", new SignUpSelectEmailController());

        //로그인
        controllerMap.put("/memberlogin.do", new MemberLoginController());
        //로그아웃
        controllerMap.put("/memberlogout.do", new MemberLogoutController());
        //아이디 찾기
        controllerMap.put("/memberfindloginid.do", new MemberSelectFindLoginIdController());
        //비밀번호 찾기
        controllerMap.put("/memberfindpass.do", new MemberSelectFindPassController());
        controllerMap.put("/memberselectpass.do", new MemberSelectPassController());
        
        //이수민.
        controllerMap.put("/memberdelete.do", new MemberDeleteController());
        controllerMap.put("/memberupdate.do", new MemberUpdateController());
        controllerMap.put("/usernicknamecheck.do", new UserdetailSelectNicknameController());
        controllerMap.put("/useremailcheck.do", new UserdetailSelectEmailController());
        controllerMap.put("/userdetailselect.do", new UserdetailSelectUserListController());
        controllerMap.put("/userdetaildelete.do", new UserdetailSelectUserDeleteController());

        //게시판
        controllerMap.put("/boardinsert.do", new BoardInsertController());
        controllerMap.put("/boardselect.do", new BoardSelectController());
        controllerMap.put("/boarddetailselect.do", new BoardDetailSelectController());
        controllerMap.put("/boardupdate.do", new BoardUpdateController());
        controllerMap.put("/boarddelete.do", new BoardDeleteController());
        controllerMap.put("/boardrankinsert.do", new BoardRankInsertController());

        //좋아요
        controllerMap.put("/boardlikeinsert.do", new BoardLikeInsertController());
        controllerMap.put("/boardlikesearch.do", new BoardLikeSearchController());
        controllerMap.put("/teamlikeupdate.do", new TeamLikeUpdateController());
        //댓글
        controllerMap.put("/comentinsert.do", new ComentInsertController());
        controllerMap.put("/comentselect.do", new ComentSelectController());
        controllerMap.put("/comentdelete.do", new ComentDeleteController());
        controllerMap.put("/comentedit.do", new ComentEditController());

        //팀관련 API
        controllerMap.put("/teaminsert.do", new TeamInsertController());
        controllerMap.put("/teamselects.do", new TeamSelectController());
        controllerMap.put("/teamdisableselects.do", new TeamDisableSelectController());
        controllerMap.put("/teamstats.do", new TeamStatsController());
        controllerMap.put("/teamdelete.do", new TeamDeleteController());
        controllerMap.put("/teamactivate.do", new TeamActivateController());
        controllerMap.put("/teamselectmyteam.do", new TeamSelectMyTeamController());
        controllerMap.put("/teamselectall.do", new TeamSeclectAllController());
        controllerMap.put("/selectloginid.do", new SignUpSelectLoginIdController());
        controllerMap.put("/selectemail.do", new SignUpSelectEmailController());
        controllerMap.put("/naverlogin.do", new NaverLoginController());
        controllerMap.put("/githublogin.do", new GitHubLoginController());
        controllerMap.put("/kakaologin.do", new KakaoLoginController());
        controllerMap.put("/voteok.do", new VoteUpdateOkController());
        controllerMap.put("/teammember.do", new TeamMemberSelectController());
        controllerMap.put("/teamleaderteampage.do", new TeamMemberLeaderTeamPageSelectController());

        controllerMap.put("/teammemberkick.do", new TeamMemberKickController());
        controllerMap.put("/teammemberleaderchange.do", new TeamMemberLeaderChangeController());

        controllerMap.put("/teampassselect.do", new TeamPassSelectController());
        //신고 관련 API
        controllerMap.put("/reportinsert.do", new ReportInsertController());

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
        controllerMap.put("/adminupdatereport.do", new AdminUpdateReportController());
        controllerMap.put("/adminselectstudymember.do", new AdminSelectStudyMemberController());
        controllerMap.put("/adminupdatestudyroll.do", new AdminUpdateStudyRollController());
        controllerMap.put("/adminselectdisablestudymember.do", new AdminSelectDisableStudyMemberController());
        controllerMap.put("/adminupdatestudymemberactivate.do", new AdminUpdateStudyMemberActivateController());
        controllerMap.put("/adminselectboard.do", new AdminSelectBoardController());
        controllerMap.put("/admindeleteboard.do", new AdminDeleteBoardController());
        controllerMap.put("/adminavgboard.do", new AdminAvgBoardController());
        
        //팀멤버
        controllerMap.put("/teammemberleaders.do", new TeamMemberLeaderSelectController());
        controllerMap.put("/teammemberselectpage.do", new TeamMemberSelectPageController());
        controllerMap.put("/teammemberupdatepage.do", new TeamMemberUpdatePageController());
        controllerMap.put("/teammemberinsertpage.do", new TeamMemberInsertPageController());
        controllerMap.put("/teammemberdeletepage.do", new TeamMemberDeletePageController());

        //마이페이지
        controllerMap.put("/myboardlist.do", new MyBoardListController());
        controllerMap.put("/mycommentList.do", new MyCommentListController());
        controllerMap.put("/mylikecontroller.do", new MyLikeListController());
        controllerMap.put("/myvote.do", new MyVoteListController());


        //투표 관련 API
        controllerMap.put("/voteinsert.do", new VoteInsertController());
        controllerMap.put("/voteselect.do", new VoteSelectController());
        controllerMap.put("/voteselectrank.do", new VoteSelectRankController());

        //재미나이 챗봇
        controllerMap.put("/googlegenai.do", new GoogleGenaiController());
        controllerMap.put("/groobotselect.do", new GrooBotSelectController());
    }

    public Controller getControllers(String command) {
        return controllerMap.get(command);
    }
}
