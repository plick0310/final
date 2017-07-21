package com.wooltari.mockTest.challengeList;

import java.util.List;
import java.util.Map;

public interface ChallengeListService {
	public List<ChallengeList> challengeList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<ChallengeList> highChartList(Map<String, Object> map);
}
