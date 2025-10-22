package com.groo.error;
/**
 * DAO의 예외를 받아오는 커스텀 예외처리
 */
public class InternalDataAccessException extends RuntimeException{

	public InternalDataAccessException() {
		super();
	}
	public InternalDataAccessException(String message) {
		super(message);
	}
	public InternalDataAccessException(String message, Throwable cause) {
		super(message, cause);
	}
	public InternalDataAccessException(Throwable cause) {
		super(cause);
	}
}
