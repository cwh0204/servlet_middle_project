package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

import com.groo.controller.Controller;
import com.groo.controller.GitHubLogin;
import com.groo.controller.KakaoLogin;
import com.groo.controller.LoginImpl;
import com.groo.controller.MainImpl;
import com.groo.controller.MemberSelectImplAPI;
import com.groo.controller.MyPageImpl;
import com.groo.controller.NaverLogin;
import com.groo.controller.SignUpImpl;
import com.groo.controller.TeamCreateImpl;
import com.groo.controller.TeamSelectImpl;




public class FrontControllerPath {

    private Map<String, Controller> controllerMap = new HashMap<>();

    public FrontControllerPath() {
        controllerMap.put("/logins.do", new LoginImpl());
        //controllerMap.put("/index.do", new MainImpl()); // indexImpl 재구성
        controllerMap.put("/main.do", new MainImpl());
        controllerMap.put("/singnups.do", new SignUpImpl());
        controllerMap.put("/teamcreates.do", new TeamCreateImpl());
        controllerMap.put("/teamselects.do", new TeamSelectImpl());
        controllerMap.put("/mypage.do", new MyPageImpl());
        
        controllerMap.put("/mypage.do", new MyPageImpl());
        
        controllerMap.put("/naverlogin.do", new NaverLogin());
        controllerMap.put("/githublogin.do", new GitHubLogin());
        controllerMap.put("/kakaologin.do", new KakaoLogin());
        
        controllerMap.put("/MemberSelectImplAPI.do", new MemberSelectImplAPI());
    }

    public Controller getControllers(String command) {
        return controllerMap.get(command);
    }
}
