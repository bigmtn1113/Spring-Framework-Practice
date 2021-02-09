package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.Ch14BoardDao;
import com.mycompany.webapp.dao.Ch14MemberDao;
import com.mycompany.webapp.dto.Ch14Board;
import com.mycompany.webapp.dto.Ch14Member;
import com.mycompany.webapp.dto.Ch14Pager;

@Service
public class Ch14Service {
	@Resource private Ch14MemberDao memberDao;

	public void join(Ch14Member member) {
		memberDao.insert(member);
	}

	public String login(Ch14Member member) {
		Ch14Member dbMember = memberDao.selectByMid(member.getMid());

		if (dbMember == null) {
			return "wrongMid";
		}

		if (member.getMpassword().equals(dbMember.getMpassword())) {
			return "success";
		}

		return "wrongMpassword";
	}

	@Resource private Ch14BoardDao boardDao;

	public List<Ch14Board> getBoardList() {
		List<Ch14Board> list = boardDao.selectAll();

		return list;
	}

	public List<Ch14Board> getBoardList(Ch14Pager pager) {
		List<Ch14Board> list = boardDao.selectByPage(pager);

		return list;
	}

	public int boardWrite(Ch14Board board) {
		int rows = boardDao.insert(board);

		return rows;
	}

	public int getTotalRows() {
		int totalRows = boardDao.countAll();

		return totalRows;
	}

	public Ch14Board getBoard(int bno) {
		Ch14Board board = boardDao.selectByBno(bno);

		return board;
	}

	public int boardDelete(int bno) {
		int rows = boardDao.deleteByBno(bno);

		return rows;
	}

	public int boardUpdate(Ch14Board board) {
		int rows = boardDao.updateBoard(board);

		return rows;
	}
}
