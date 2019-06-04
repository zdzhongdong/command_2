package com.lovo.util;

public class StaticTool {
	
	public static String IMGERROR = "不支持此类型";
	public static String PAGEERROR = "页面暂时无法访问";
	
	public static String getFileSubffix(String fileType) {
		switch (fileType) {
		case "image/jpeg":
			return ".jpg";
		default:
			return null;
		}
		
		
	}
}
