package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

import com.groo.controller.Controller;
import com.groo.controller.LoginImpl;
import com.groo.controller.MainImpl;
import com.groo.controller.SignUpImpl;
import com.groo.controller.TeamCreateImpl;
import com.groo.controller.TeamSelectImpl;

public class FrontControllerPath {

    private Map<String, Controller> controllerMap = new HashMap<>();

    public FrontControllerPath() {
        controllerMap.put("/logins.do", new LoginImpl());
        controllerMap.put("/indexs.do", new MainImpl());
        controllerMap.put("/singnups.do", new SignUpImpl());
        controllerMap.put("/teamcreates.do", new TeamCreateImpl());
        controllerMap.put("/teamselects.do", new TeamSelectImpl());
    }

    public Controller getControllers(String command) {
        return controllerMap.get(command);
    }
}
