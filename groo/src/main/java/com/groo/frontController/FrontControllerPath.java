package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

import com.groo.controller.AdminSelectUserAllController;
import com.groo.controller.AdminSelectUserInsertCheckController;
import com.groo.controller.Controller;

import com.groo.controller.GitHubLoginController;
import com.groo.controller.KakaoLoginController;
import com.groo.controller.LoginController;
import com.groo.controller.MainController;
import com.groo.controller.MemberSelectController;
import com.groo.controller.MyPageController;
import com.groo.controller.NaverLoginController;
import com.groo.controller.SignUpController;
import com.groo.controller.TeamCreateController;
import com.groo.controller.TeamSelectController;




public class FrontControllerPath {

    private Map<String, Controller> controllerMap = new HashMap<>();

    public FrontControllerPath() {
        controllerMap.put("/logins.do", new LoginController());
        controllerMap.put("/mains.do", new MainController());
        controllerMap.put("/singnups.do", new SignUpController());
        controllerMap.put("/teamcreates.do", new TeamCreateController());
        controllerMap.put("/teamselects.do", new TeamSelectController());
        controllerMap.put("/mypages.do", new MyPageController());

        controllerMap.put("/mypages.do", new MyPageController());


        controllerMap.put("/naverlogin.do", new NaverLoginController());
        controllerMap.put("/githublogin.do", new GitHubLoginController());
        controllerMap.put("/kakaologin.do", new KakaoLoginController());
        controllerMap.put("/naverlogin.do", new NaverLoginController());
        controllerMap.put("/githublogin.do", new GitHubLoginController());
        controllerMap.put("/kakaologin.do", new KakaoLoginController());

        controllerMap.put("/MemberSelectImplAPI.do", new MemberSelectController());

        controllerMap.put("/adminuserselectall.do", new AdminSelectUserAllController());
        controllerMap.put("/adminuserselectcheck.do", new AdminSelectUserInsertCheckController());

    }

    public Controller getControllers(String command) {
        return controllerMap.get(command);
    }
}
