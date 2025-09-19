package com.groo.frontController;

import java.util.HashMap;
import java.util.Map;

import com.groo.controller.Controller;
import com.groo.controller.LoginImpl;

public class FrontControllerPath {

    private Map<String, Controller> controllerMap = new HashMap<>();

    public FrontControllerPath() {
        controllerMap.put("/logins.do", new LoginImpl());
    }

    public Controller getControllers(String command) {
        return controllerMap.get(command);
    }
}