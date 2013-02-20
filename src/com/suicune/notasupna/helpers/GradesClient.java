package com.suicune.notasupna.helpers;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class GradesClient {
	public static final String server = "upnaexp.unavarra.es";
	public static final int port = 19090;
	public static final String resource_es = "/sigdroid-rest/resources/obtenerCalificaciones?idioma=es&pais=ES&av="
			+ android.os.Build.VERSION.RELEASE + "&sv=1.7&os=ANDROID";
	public static final String resource_eu = "/sigdroid-rest/resources/obtenerCalificaciones?idioma=eu&pais=ES&av="
			+ android.os.Build.VERSION.RELEASE + "&sv=1.7&os=ANDROID";
	private String mUserName;
	private String mPassWord;
	private URL mUrl;

	public GradesClient(URL url, String userName, String passWord) {
		mUrl = url;
		mUserName = userName;
		mPassWord = passWord;
	}

	public String connectToServer() {
		String response = null;
		/*
		 * Using the Apache libraries for connections allows easy handling of
		 * HTTP requests as this one. UsernamePasswordCredentials allows use of
		 * username and password for HTTP authentication both in HTTP and HTTPS.
		 * HttpGet allows us to make a Http GET petition to the server to
		 * retrieve the data using just the url we set on the PreExecute stage
		 * of the task.
		 */
		DefaultHttpClient httpClient = new DefaultHttpClient();
		httpClient.getCredentialsProvider().setCredentials(AuthScope.ANY,
				new UsernamePasswordCredentials(mUserName, mPassWord));
		HttpGet request = new HttpGet(mUrl.toExternalForm());

		/*
		 * To parse the response we need to look for general Exceptions, because
		 * we get a lot of different ones, all meaning the same: The connection
		 * didn't went through. Providing we've already checked connection and
		 * tunnel, it must be a filtering proxy or a server error, so we will
		 * just cancel the task and exit with a message. The HttpResponse class
		 * allows us to get a full response for any well-formed request.
		 */
		try {
			HttpResponse httpResponse = httpClient.execute(request);
			InputStream input = httpResponse.getEntity().getContent();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					input));
			response = reader.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
}
