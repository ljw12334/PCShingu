package com.pcmall.javaClass;

public class InvalidFileExtensionException extends Exception{
	public InvalidFileExtensionException() {
		
	}
	
	public InvalidFileExtensionException(String message) {
		super(message);
	}
}
