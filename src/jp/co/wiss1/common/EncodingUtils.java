package jp.co.wiss1.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingUtils extends HttpServlet{
	public static void responseEncoding(HttpServletRequest request,HttpServletResponse response)
		throws IOException, ServletException{
			//ブラウザの文字コードで返す
			request.setCharacterEncoding(Constants.CHARACTER_ENCODING);
			response.setContentType("text/html;charset="+Constants.CHARACTER_ENCODING);
	}
}