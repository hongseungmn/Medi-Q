package com.kosmo.springapp.service;

import java.util.Map;

public interface SocialLoginService {

	String getAccessToken(String authorize_code);
	Map<String,Object> getUserInfo(String access_token);
}
