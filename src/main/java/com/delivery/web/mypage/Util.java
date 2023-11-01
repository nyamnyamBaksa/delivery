package com.delivery.web.mypage;

import org.springframework.stereotype.Component;

@Component
public class Util {
	// 문자열이 들어오면 숫자로 변경하기
	public int strToInt(String str) {
		// 숫자로 바꿀 수 있는 경우 숫자로, 만약 숫자로 못 바꾼다면?
		// "156" -> 156 "156번" -> 156
		int result = 0;

		try {
			result = Integer.parseInt(str);
		} catch (Exception e) {
			// String re = "";// 숫자인것만 모을 스트링
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < str.length(); i++) {
				if (Character.isDigit(str.charAt(i))) {// 숫자인지 물어봄
					// re += str.charAt(i);// 숫자만 모아서
					sb.append(str.charAt(i));
				} else {
					return 0;
				}
			}
			result = Integer.parseInt(sb.toString());// 숫자로 만들어서
		}
		return result;// 되돌려준다.
	}
	
}
