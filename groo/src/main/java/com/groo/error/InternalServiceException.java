package com.groo.error;

/**
 * 서비스에서 나오는 예외를 받아오는 예외처리
 */
public class InternalServiceException extends RuntimeException {

	public InternalServiceException() {
		super();
	}

	public InternalServiceException(String message) {
		super(message);
	}

	public InternalServiceException(String message, Throwable cause) {
		super(message, cause);
	}

	public InternalServiceException(Throwable cause) {
		super(cause);
	}
}
