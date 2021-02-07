package com.mycompany.webapp.view;

import java.io.File;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class Ch12FileListView extends AbstractView{
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch12FileListView.class); 
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		File uploadDir = new File("C:/MyWorkspace/Temp/upload");
		String[] fileNames = uploadDir.list();
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//["a.jpg", "b.jpg", "c.jpg"]
		JSONArray jsonArray = new JSONArray();
		for (String fileName : fileNames) {
			jsonArray.put(fileName);
		}
		String json = jsonArray.toString();
		LOGGER.info(json);
		
		out.write(json);
		out.flush();
		out.close();
	}
}
