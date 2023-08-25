package com.kosmo.springapp.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ProfileImageDTO;
import com.kosmo.springapp.service.FileUtils;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.LoginMapper;
import com.kosmo.springapp.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService<MemberDTO> {

	@Autowired
	private TransactionTemplate template;
	@Autowired
	private JWTokensService jwTokensService;
	@Autowired
	private LoginMapper mapper;

	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;

	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberDTO> selectMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO selectOne(String id) {
		return mapper.findMember(id);
	}
	
	public MemberDTO selectOne(HttpServletRequest req) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		
		try {
			String id = payloads.get("sub").toString();
			return mapper.findMember(id);
		} catch (NullPointerException e) {
			return null;
		}
	}

	@Override
	public int insert(MemberDTO member) {

		return mapper.save(member);
	}

	@Override
	public int update(MemberDTO info) {
		
		return mapper.update(info);
	}

	@Override
	public int delete(HttpServletRequest req) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		String id = payloads.get("sub").toString();

		return mapper.delete(id);
	}

	// 로그인 시 아이디,비밀번호 일치하는지 확인
	public boolean isMember(Map map) {

		return mapper.findByIdAndPwd(map);
	}

	public boolean idCheck(Map map) {

		return mapper.checkById(map);
	}

	@Autowired
	private EmailServiceImpl emailService;
	
	//아이디,비밀번호 찾기 클릭 시
	public String selectOneIdNPwd(Map map) throws UnsupportedEncodingException, MessagingException {
		String message="";
		MemberDTO dto = mapper.searchIdNPwd(map);
		String mode = map.get("mode").toString();
		String email = map.get("email").toString();
		if(dto != null) {
			if("Y".equals(dto.getSocial_Fl())) {//소셜로 로그인한 이메일 입력 시
				message = "Social-Member";
			}
			else if ("ID".equals(map.get("mode"))) {// 아이디찾기 클릭 시
				String id = dto.getId();
				message = emailService.sendMessage(email,id,mode);
			} else {// 비밀번호 찾기 클릭 시
				String pwd = dto.getPassword();
				message = emailService.sendMessage(email,pwd,mode);
			}
		}
		else {
			message = "Not-Member";
		}
		return message;
	}

	//소셜 로그인 시
	public String socialLogin(Map userInfo,String accessToken) {
		String id = userInfo.get("email").toString();//이메일
		MemberDTO member =  mapper.findMember(id);

		// 토큰 생성한 뒤 쿠키에 저장
		Map<String, Object> payloads = new HashMap<>();// 사용자 임의 데이타
		payloads.put("socialInfo", accessToken);///////////////////////////
		payloads.put("name", member.getName());

		long expirationTime = 1000 * 60 * 60 * 24; // 토큰의 만료시간 설정

		String token = jwTokensService.createToken(id, secretKey, payloads, expirationTime);
		//System.out.println("token: "+token);
		return token;
	}

	//로그인한 회원의 비밀번호와 일치하는지 확인용 메소드
	public boolean isCorrectPassword(Map map) {
		
		return mapper.checkByPassword(map);
	}

	@Value("${file.upload}")
	private String SaveDirectory;	
	
	//프로필 이미지 수정(기본 이미지 X)
	public ProfileImageDTO editProfImg(ProfileImageDTO dto) throws IllegalStateException, IOException {
		String newFilename="";
		
		Resource resource = new ClassPathResource(SaveDirectory);
		String phisicalPath = resource.getFile().getAbsolutePath()+"\\profImg";
		
		try {
			File uploadFiles = new File(phisicalPath);
			
			if(!uploadFiles.exists()) {//업로드 폴더가 없을 경우
				uploadFiles.mkdirs();
			}
			
			MultipartFile imgFile = dto.getFile();
			
			String id = dto.getId();
			
			if(imgFile != null) {//변경 이미지 선택 시
				////////////////////////////////////////////////////////////////
				if("Y".equals(mapper.findMember(id).getProf_Img_Fl())) {
					
					//기존 프로필이미지 있는경우(db 삭제 해야함, 업로드 폴더 이미지 삭제)
					ProfileImageDTO info = mapper.findProfImg(id);
					FileUtils.deletes(new StringBuffer(info.getPi_Filename()+"."+info.getPi_Ext()), phisicalPath, ",");
					mapper.deleteProfImg(id);
				}
				
				newFilename = FileUtils.getNewFileName(phisicalPath, imgFile.getOriginalFilename());
				File file = new File(phisicalPath+File.separator+newFilename);
				imgFile.transferTo(file);//업로드 폴더에 이미지 업로드
				
				String filename = newFilename.substring(0, newFilename.lastIndexOf("."));
				String ext = newFilename.substring(newFilename.lastIndexOf(".") + 1);
				
				dto.setPi_Path(phisicalPath);
				dto.setPi_Filename(filename);
				dto.setPi_Ext(ext);
						
				return dto;
			}
		}catch (Exception e) {// 문제 시 업로드된 파일 삭제
			FileUtils.deletes(new StringBuffer(newFilename), phisicalPath, ",");
			System.out.println("error: "+e.getMessage());
		}
		return null;
	}
	
	//기본이미지로 수정 시
	public int editProfImgDefault(ProfileImageDTO dto) throws IOException {
		int deleteFlag = 0;
		String id = dto.getId();

		if("Y".equals(mapper.findMember(id).getProf_Img_Fl())) {
			ProfileImageDTO info = mapper.findProfImg(id);
			
			//기존에 파일이 있는 경우
			Resource resource = new ClassPathResource(SaveDirectory);
			String phisicalPath = resource.getFile().getAbsolutePath()+"\\profImg";
			
			FileUtils.deletes(new StringBuffer(info.getPi_Filename()+"."+info.getPi_Ext()), phisicalPath, ",");
			deleteFlag = mapper.deleteProfImg(id);
		}
		else deleteFlag = -1;
		
		return deleteFlag;
	}

	public int insertProfImg(ProfileImageDTO info) {
		
		return mapper.saveProfImg(info);
	}

	public int updateProfImg(MemberDTO dto) {
		return mapper.updateProfImg(dto);
	}

	public ProfileImageDTO selectProfImg(String id) {
		
		return mapper.findProfImg(id);
	}
	
}
