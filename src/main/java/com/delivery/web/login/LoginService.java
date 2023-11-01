package com.delivery.web.login;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public Map<String, Object> login(Map<String, Object> map) {
		return loginDAO.login(map);
	}

	public int autologinCheckbox(Map<String, Object> result) {
		return loginDAO.autologinCheckbox(result);
	}

	// 네이버에 코드전송 & 인증토큰받기
	public String getNaverToken(String Ncode) {

		String Naccess_Token = "";
		String Nrefresh_Token = "";
		String NreqURL = "https://nid.naver.com/oauth2.0/token";

		 try{
	          URL url = new URL(NreqURL);
	          HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	          //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	          conn.setRequestMethod("POST");
	          conn.setDoOutput(true);

	          //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	          BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	          StringBuilder sb = new StringBuilder();
	          sb.append("grant_type=authorization_code");
	          sb.append("&client_id=59vsSNIzNRQBcSk4rubJ"); // TODO Client ID 입력
	          sb.append("&client_secret=NEnhPeGlLC"); // TODO Client Secret 입력
	          sb.append("&code=" + Ncode);
	          sb.append("&redirect_uri=http://localhost/login/naver"); // TODO 인가코드 받은 redirect_uri 입력
	          bw.write(sb.toString());
	          bw.flush();

	          //결과 코드가 200이라면 성공
	          int NresponseCode = conn.getResponseCode();
	          System.out.println("NresponseCode : " + NresponseCode);
	          
	          //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	          BufferedReader Nbr = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	          String Nline = "";
	          String Nresult = "";

	          while ((Nline = Nbr.readLine()) != null) {
	        	  Nresult += Nline;
	          }
	          //System.out.println("Nresponse body : " + Nresult);

	          //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	          JsonParser parser = new JsonParser();
	          JsonElement element = parser.parse(Nresult);

	          Naccess_Token  = element.getAsJsonObject().get("access_token").getAsString();
	          Nrefresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	         //System.out.println("Naccess_token : " + Naccess_Token);	
	         System.out.println("Nrefresh_token : " + Nrefresh_Token);
	          
	          Nbr.close();
	          bw.close();
	          
	      }catch (Exception e) {
	          e.printStackTrace();
	      }

	      return Naccess_Token;
	}
	// 네이버에 토큰전송 & 사용자정보받기
	   public  Map<String, Object> getNaverUser(String Naccess_token){

		   Map<String, Object> Nmap = new HashMap<>();
		   
	        String reqURL = "https://openapi.naver.com/v1/nid/me";
	        String id="";
	        String email = "";
	        String nickname = "";
	        String mobile = "";

	        //access_token을 이용하여 사용자 정보 조회
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            conn.setRequestProperty("Authorization", "Bearer " + Naccess_token); //전송할 header 작성, access_token전송

	            //결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            //System.out.println("response body : " + result);
	            //response body : {"resultcode":"00","message":"success",

	            // 네이버 유저정보 받아오기
	            Gson gson = new Gson();
	            JsonObject jsonObject = gson.fromJson(result, JsonObject.class);
	            JsonElement element = jsonObject.get("response");
	            
	            // 받아올값 : id, nickname, email, mobile
	            id = element.getAsJsonObject().get("id").getAsString().substring(0, 5);
	            email = element.getAsJsonObject().get("email").getAsString();
	            nickname = element.getAsJsonObject().get("nickname").getAsString();
	            mobile = element.getAsJsonObject().get("mobile").getAsString();
	            
	            // Map에 담기
	            Type type = new TypeToken<Map<String, Object>>() {}.getType();
	            Nmap = gson.fromJson(element, type);

	            Nmap.put("Nid", id);
	          	Nmap.put("Nemail", email);
	          	Nmap.put("Nname", nickname);
	          	Nmap.put("Nphone", mobile);
	            
	            br.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return Nmap;
	    }

	public int hasNaverUser(Map<String, Object> nUser) {
		return loginDAO.hasNaverUser(nUser);
	}
}
