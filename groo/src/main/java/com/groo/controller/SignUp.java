package com.groo.controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface SignUp {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
