NE APPS Ltd. 홈페이지 (JSP)

[구조]
index.jsp            메인 페이지
notice.jsp           공고 게시판 (목록 / ?id=번호 로 상세)
css/style.css        디자인
js/main.js           문의 폼(메일 작성 창 연결)
WEB-INF/inc/site.jspf     회사 정보, 공고 데이터  <- 주로 여기만 수정
WEB-INF/inc/header.jspf   공통 헤더
WEB-INF/inc/footer.jspf   공통 푸터

[배포] JSP를 지원하는 서버(Tomcat 등)의 웹 루트(예: webapps/ROOT)에 폴더 내용을 그대로 복사

[수정]
- 회사 정보, 이메일: site.jspf 상단 상수
- 공고 추가: site.jspf 의 NOTICES 맨 위에 항목 추가 (번호는 중복 불가)
- 공고 직접 링크: https://도메인/notice.jsp?id=1
