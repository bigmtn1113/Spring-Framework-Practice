package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Ch14Board;
import com.mycompany.webapp.dto.Ch14Member;
import com.mycompany.webapp.dto.Ch14Pager;
import com.mycompany.webapp.service.Ch14Service;

@Controller
@RequestMapping("/ch14")
public class Ch14Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch14Controller.class);

	@RequestMapping("/content")
	public String content() {
		LOGGER.info("실행");

		return "ch14/content";
	}

	@Resource private DataSource dataSource;

	@GetMapping("/connTest")
	public String connTest() {
		try {
			// 연결 객체 대여
			Connection conn = dataSource.getConnection();
			// 연결 객체 반납
			conn.close();
			// 로그 출력
			LOGGER.info("연결 객체를 성공적으로 대여 후 반납");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 페이징 처리 확인을 위해 게시물 대량 작성
		/*for (int i = 1; i < 1000; ++i) {
			Ch14Board board = new Ch14Board();
			board.setBtitle("test title" + i);
			board.setBcontent("test content" + i);
			board.setMid("id");
			service.boardWrite(board);
		}*/

		return "ch14/content";
	}

	@Resource private Ch14Service service;

	@PostMapping("/join")
	public String join(Ch14Member member) throws IllegalStateException, IOException {
		if (!member.getMphotoAttach().isEmpty()) {
			String originalFileName = member.getMphotoAttach().getOriginalFilename();
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveName = member.getMid() + extName;
			File dest = new File("C:/MyWorkspace/photo/" + saveName);

			member.getMphotoAttach().transferTo(dest);
			member.setMphoto(saveName);
		} else {
			member.setMphoto("unnamed.png");
		}

		member.setMenabled(true);
		member.setMrole("ROLE_USER");
		service.join(member);

		return "redirect:/ch14/content";
	}

	@PostMapping("/login")
	public String login(Ch14Member member, HttpSession session, Model model) {
		String result = service.login(member);

		if (result.equals("success")) {
			session.setAttribute("sessionMid", member.getMid());

			return "redirect:/ch14/content";
		} else {
			model.addAttribute("error", result);

			return "ch14/content";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/ch14/content";
	}

	// 페이징 처리 하지 않고 게시물 목록 다 불러오기
	/*@GetMapping("/boardList")
	public String boardList(Model model) {
		List<Ch14Board> list = service.getBoardList();
		model.addAttribute("list", list);
		return "ch14/boardList";
	}*/

	@GetMapping("/boardList")
	public String boardList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int totalRows = service.getTotalRows();
		Ch14Pager pager = new Ch14Pager(10, 5, totalRows, pageNo);
		List<Ch14Board> list = service.getBoardList(pager);

		model.addAttribute("list", list);
		model.addAttribute("pager", pager);

		return "ch14/boardList";
	}

	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		LOGGER.info("fileName: " + fileName);

		// 파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/MyWorkspace/photo/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);

		// 응답 HTTP 헤더 구성
		// 1)Content-Type 헤더 구성
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileType);

		// 2)Content-Disposition 헤더 구성
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		// 3)Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int) new File(saveFilePath).length();
		response.setContentLength(fileSize);

		// 응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);

		os.flush();
		os.close();
		is.close();
	}

	@GetMapping("/boardWrite")
	public String boardWriteForm() {
		return "ch14/boardWriteForm";
	}

	@PostMapping("/boardWrite")
	public void boardWrite(Ch14Board board, HttpServletResponse response) throws Exception {
		// 서비스를 이용해서 게시물 쓰기
		service.boardWrite(board);
		// JSON 생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		// 응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");

		out.println(json);
		out.flush();
		out.close();
	}

	@GetMapping("/boardDetail")
	public String boardDetail(int bno, Model model) {
		Ch14Board board = service.getBoard(bno);

		model.addAttribute("board", board);

		return "ch14/boardDetail";
	}

	@PostMapping("/boardDelete")
	public void boardDelete(int bno, HttpServletResponse response) throws Exception {
		// 서비스를 이용해서 게시물 쓰기
		service.boardDelete(bno);
		// JSON 생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		// 응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");

		out.println(json);
		out.flush();
		out.close();
	}

	@GetMapping("/boardUpdate")
	public String boardUpdateForm(int bno, Model model) {
		Ch14Board board = service.getBoard(bno);

		model.addAttribute("board", board);

		return "ch14/boardUpdateForm";
	}

	@PostMapping("/boardUpdate")
	public void boardUpdate(Ch14Board board, HttpServletResponse response) throws Exception {
		// 서비스를 이용해서 게시물 쓰기
		service.boardUpdate(board);
		// JSON 생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		// 응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
}
