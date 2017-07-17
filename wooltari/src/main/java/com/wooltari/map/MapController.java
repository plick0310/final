package com.wooltari.map;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("map.mapController")
public class MapController {
	@RequestMapping(value = "/map/trans", method=RequestMethod.POST)
	@ResponseBody
	public String trans(String address) {
		StringBuilder html = new StringBuilder();
		String url = "https://openapi.naver.com/v1/map/geocode?query=" + address; //encodeURIComponent로 인코딩 된 주소
		String clientId = "tkYb1p5roIP90h3KhPZ_"; //Client ID 를 넣습니다.
		String clientSecret = "oJAoEuYqsm"; //Secret Key를 넣습니다.

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);
		request.addHeader("X-Naver-Client-Id", clientId); //해더에 Clinet Id와 Client Secret을 넣습니다
		request.addHeader("X-Naver-Client-Secret", clientSecret);
		try {
			HttpResponse response = client.execute(request);
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
			String current = "";
			while ((current = reader.readLine()) != null) {
				html.append(current);
			}
			reader.close();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return html.toString();
	}
}
