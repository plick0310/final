package com.wooltari.keyword;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service
public class keywordServiceImpl implements keywordService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<StudyInfo> studyList(Map<String, Object> map) {
		List<StudyInfo> list = null;

		try {
			list = dao.getListData("keyword.study", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<StudyInfo> allStudyList(Map<String, Object> map) {
		List<StudyInfo> list = null;

		try {
			list = dao.getListData("keyword.allStudy", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int studyCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.getIntValue("keyword.studyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<DownloadBoard> DownloadBoardList(Map<String, Object> map) {
		List<DownloadBoard> list = null;

		try {
			list = dao.getListData("keyword.DownloadBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<DownloadBoard> allDownloadBoardList(Map<String, Object> map) {
		List<DownloadBoard> list = null;

		try {
			list = dao.getListData("keyword.allDownloadBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int DownloadBoardCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.getIntValue("keyword.DownloadBoardCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<MockTest> MockTestList(Map<String, Object> map) {
		List<MockTest> list = null;

		try {
			list = dao.getListData("keyword.MockTestList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MockTest> allMockTestList(Map<String, Object> map) {
		List<MockTest> list = null;

		try {
			list = dao.getListData("keyword.allMockTestList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int MockTestCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.getIntValue("keyword.MockTestCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Promote> PromoteList(Map<String, Object> map) {
		List<Promote> list = null;
		try {
			list = dao.getListData("keyword.PromoteList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Promote> allPromoteList(Map<String, Object> map) {
		List<Promote> list = null;
		try {
			list = dao.getListData("keyword.allPromoteList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int PromoteCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("keyword.PromoteCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Review> ReviewList(Map<String, Object> map) {
		List<Review> list = null;

		try {
			list = dao.getListData("keyword.ReviewList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Review> allReviewList(Map<String, Object> map) {
		List<Review> list = null;

		try {
			list = dao.getListData("keyword.allReviewList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int ReviewCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.getIntValue("keyword.ReviewCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<StudyMarketBoard> StudyMarketBoardList(Map<String, Object> map) {
		List<StudyMarketBoard> list = null;

		try {
			list = dao.getListData("keyword.StudyMarketBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<StudyMarketBoard> allStudyMarketBoardList(Map<String, Object> map) {
		List<StudyMarketBoard> list = null;

		try {
			list = dao.getListData("keyword.allStudyMarketBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int StudyMarketBoardCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.getIntValue("keyword.StudyMarketBoardCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<StudyWhere> StudyWhereList(Map<String, Object> map) {
		List<StudyWhere> list = null;

		try {
			list = dao.getListData("keyword.StudyWhereList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<StudyWhere> allStudyWhereList(Map<String, Object> map) {
		List<StudyWhere> list = null;

		try {
			list = dao.getListData("keyword.allStudyWhereList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int StudyWhereCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.getIntValue("keyword.StudyWhereCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
