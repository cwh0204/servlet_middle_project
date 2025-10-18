package com.groo.error;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ErrorDTO {
	private LocalDateTime timestamp = LocalDateTime.now();
	private int status;
	private String error;
	private String path;

	public ErrorDTO(int status, String error, String path) {
		// TODO Auto-generated constructor stub
		timestamp = LocalDateTime.now();
		this.status = status;
		this.error = error;
		this.path = path;
	}
}
