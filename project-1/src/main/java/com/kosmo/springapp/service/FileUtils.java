package com.kosmo.springapp.service;

import java.io.File;

public class FileUtils {
	// [파일 이름 중복 체크용 메소드]
	/**
	 * 중복파일이 있을 경우 인덱싱 번호를 추가해서 새로운 파일명을 반환하는 메소드
	 * @param path 파일이 저장된 서버의 물리적 경로
	 * @param fileName 업로드한 파일명
	 * @return
	 */
	public static String getNewFileName(String path, String fileName) {
		// fileName=원격.txt
		File file = new File(path + File.separator + fileName);
		if (!file.exists()) {
			return fileName;
		} else {
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1).trim();
			String fileNameExcludeExt = fileName.substring(0, fileName.lastIndexOf("."));

			String newFileName;
			while (true) {
				newFileName = "";
				if (fileNameExcludeExt.indexOf("_") != -1) {// 파일명에 _가 포함됨
					String[] arrFiles = fileNameExcludeExt.split("_");
					String lastName = arrFiles[arrFiles.length - 1];
					try {
						int index = Integer.parseInt(lastName);
						for (int i = 0; i < arrFiles.length; i++) {
							if (i != arrFiles.length - 1)
								newFileName += arrFiles[i] + "_";
							else
								newFileName += String.valueOf(index + 1);
						}
						newFileName += "." + ext;
					} catch (Exception e) {
						newFileName += fileNameExcludeExt + "_1." + ext;
					}
				} else {// _가 없음
					newFileName += fileNameExcludeExt + "_1." + ext;
				}
				File f = new File(path + File.separator + newFileName);
				if (f.exists()) {
					fileNameExcludeExt = newFileName.substring(0, newFileName.lastIndexOf("."));
					continue;
				} else
					break;
			} //////////// while

			return newFileName;
		}
	}/////////////////////
	
	/**
	 * 파일 삭제용 메소드
	 * @param fileNames 업로드한 모든 파일명이 저장된 StringBuffer
	 * @param saveDirectory 파일이 저장된 서버의 물리적 경로
	 */
	//삭제 로직
	public static void deletes(StringBuffer fileNames,String saveDirectory, String delim) {
		String[] files = fileNames.toString().split(delim);
		for(String filename:files) {
			File f = new File(saveDirectory+File.separator+filename);
			if(f.exists()) f.delete();
		}
	}////////////////////////////////////////
}
