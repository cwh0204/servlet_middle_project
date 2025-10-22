package com.groo.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Controller  {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}