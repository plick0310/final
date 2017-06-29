package com.wooltari.exam;

public class Exam {
   private int num;
   
   // 시험정보
   private String examInfoName; // 시험명
   private String examInfoOrgan; // 주최기관명
   private String questionSubject; // 회차
   
   // 실제 볼 시험리스트
   private int wishlistNum; // 실제 볼 시험목록번호
   private int dday; // D-day
   private String examwishDate; // 응시일
   
   // 모의 테스트 목록
   private int examlistNum; // 모의 테스트목록
   private String examlistDay; // 등록일
   
   // 응시내역
   private int resultNum; // 응시내역번호
   private String examDate; // 응시날짜
   private String examCount; // 응시회수
   private String anSelect; // 선택한 답
   private String result; // 응시결과
   
   // 모의 테스트
   private int examNum; // 모의 테스트 번호
   private int examtotalCount; // 총 문제수
   private String content; // 시험내용
   private String answer; // 정답
   
   // 보기번호
   private String ex_One; // 보기 1번
   private String ex_Two; // 보기 2번
   private String ex_Three; // 보기 3번
   
   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   public String getExamInfoName() {
      return examInfoName;
   }
   public void setExamInfoName(String examInfoName) {
      this.examInfoName = examInfoName;
   }
   public String getExamInfoOrgan() {
      return examInfoOrgan;
   }
   public void setExamInfoOrgan(String examInfoOrgan) {
      this.examInfoOrgan = examInfoOrgan;
   }
   public String getQuestionSubject() {
      return questionSubject;
   }
   public void setQuestionSubject(String questionSubject) {
      this.questionSubject = questionSubject;
   }
   public int getWishlistNum() {
      return wishlistNum;
   }
   public void setWishlistNum(int wishlistNum) {
      this.wishlistNum = wishlistNum;
   }
   public int getDday() {
      return dday;
   }
   public void setDday(int dday) {
      this.dday = dday;
   }
   public String getExamwishDate() {
      return examwishDate;
   }
   public void setExamwishDate(String examwishDate) {
      this.examwishDate = examwishDate;
   }
   public int getExamlistNum() {
      return examlistNum;
   }
   public void setExamlistNum(int examlistNum) {
      this.examlistNum = examlistNum;
   }
   public String getExamlistDay() {
      return examlistDay;
   }
   public void setExamlistDay(String examlistDay) {
      this.examlistDay = examlistDay;
   }
   public int getResultNum() {
      return resultNum;
   }
   public void setResultNum(int resultNum) {
      this.resultNum = resultNum;
   }
   public String getExamDate() {
      return examDate;
   }
   public void setExamDate(String examDate) {
      this.examDate = examDate;
   }
   public String getExamCount() {
      return examCount;
   }
   public void setExamCount(String examCount) {
      this.examCount = examCount;
   }
   public String getAnSelect() {
      return anSelect;
   }
   public void setAnSelect(String anSelect) {
      this.anSelect = anSelect;
   }
   public String getResult() {
      return result;
   }
   public void setResult(String result) {
      this.result = result;
   }
   public int getExamNum() {
      return examNum;
   }
   public void setExamNum(int examNum) {
      this.examNum = examNum;
   }
   public int getExamtotalCount() {
      return examtotalCount;
   }
   public void setExamtotalCount(int examtotalCount) {
      this.examtotalCount = examtotalCount;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getAnswer() {
      return answer;
   }
   public void setAnswer(String answer) {
      this.answer = answer;
   }
   public String getEx_One() {
      return ex_One;
   }
   public void setEx_One(String ex_One) {
      this.ex_One = ex_One;
   }
   public String getEx_Two() {
      return ex_Two;
   }
   public void setEx_Two(String ex_Two) {
      this.ex_Two = ex_Two;
   }
   public String getEx_Three() {
      return ex_Three;
   }
   public void setEx_Three(String ex_Three) {
      this.ex_Three = ex_Three;
   }
   
}