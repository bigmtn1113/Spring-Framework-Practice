package com.mycompany.webapp.exception;

public class Ch10NotFoundAccountException extends RuntimeException{
	public Ch10NotFoundAccountException() {}
	
	public Ch10NotFoundAccountException(String message) {
		super(message);
	}
}
