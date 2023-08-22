package com.kosmo.springapp.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface EmailService {
	
	MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;
	String createKey();
	String sendRandomNumberMessage(String to) throws UnsupportedEncodingException, MessagingException;
	String sendMessage(String to, String info, String mode) throws MessagingException, UnsupportedEncodingException;
}
