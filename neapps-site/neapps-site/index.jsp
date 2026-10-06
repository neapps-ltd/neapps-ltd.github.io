<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/inc/site.jspf" %>
<% String pageTitle = "홈"; String active = "home"; %>
<%@ include file="/WEB-INF/inc/header.jspf" %>

<main>
<div class="hero"><div class="wrap">
 <div>
  <h1>필요한 것을 <em>만들고</em>,<br>쓰는 법을 가르칩니다.</h1>
  <p><%= esc(CO_KO) %>(<%= esc(CO_EN) %>)는 크롤링·자동화·웹·앱·AI 개발과 IT 교육을 합니다.</p>
  <div class="btns"><a class="btn" href="#contact">문의하기</a><a class="btn ghost" href="<%= ctx %>/notice.jsp">공고 게시판</a></div>
 </div>
 <div class="code" aria-hidden="true">
  <div class="bar"><span></span><span></span><span></span><em>ne_apps.py</em></div>
  <pre><span class="ln" style="--i:0"><span class="c"># NE APPS Ltd.</span></span><span class="ln" style="--i:1"><span class="k">services</span> = [<span class="s">"크롤링"</span>, <span class="s">"자동화"</span>,</span><span class="ln" style="--i:2">            <span class="s">"웹"</span>, <span class="s">"앱"</span>, <span class="s">"AI"</span>]</span><span class="ln" style="--i:3"> </span><span class="ln" style="--i:4"><span class="k">for</span> s <span class="k">in</span> services:</span><span class="ln" style="--i:5">    build(s)</span><span class="ln" style="--i:6"> </span><span class="ln" style="--i:7">teach(<span class="s">"기초부터 AI 모델까지"</span>)</span><span class="ln" style="--i:8"><span class="caret"></span></span></pre>
 </div>
 <div class="mark" aria-hidden="true">NE APPS</div>
</div></div>

<section class="sec" id="about"><div class="wrap split">
 <aside><h2>회사소개</h2><span>About</span></aside>
 <p class="lead">개발 외주와 IT 교육을 함께 해 왔습니다. 프로그래밍 기초부터 AI 모델까지, 학교·기관·기업에서 교육을 진행한 경험이 있습니다.</p>
</div></section>

<section class="sec" id="biz"><div class="wrap split">
 <aside><h2>사업분야</h2><span>Business</span></aside>
 <div class="cards">
  <div class="card">
   <h3>개발 외주</h3><p>요구사항 정리부터 개발, 납품까지 진행합니다.</p>
   <ul class="rows">
    <li><b>크롤링</b><span>웹 데이터 수집·정제</span></li>
    <li><b>자동화</b><span>반복 업무 자동화</span></li>
    <li><b>웹사이트</b><span>홈페이지·관리자 페이지</span></li>
    <li><b>애플리케이션</b><span>모바일·데스크톱 앱</span></li>
    <li><b>AI 개발</b><span>모델 적용·서비스 연동</span></li>
   </ul>
  </div>
  <div class="card">
   <h3>IT 교육</h3><p>대상과 기간에 맞춰 과정을 구성합니다.</p>
   <ul class="rows">
    <li><b>기초</b><span>프로그래밍 언어 기본</span></li>
    <li><b>실무</b><span>데이터·자동화</span></li>
    <li><b>AI</b><span>AI 모델 개발</span></li>
   </ul>
   <div class="pills"><span>장기</span><span>단기</span><span>기업</span><span>기관</span><span>온라인</span><span>오프라인</span></div>
  </div>
 </div>
</div></section>

<section class="sec" id="edu"><div class="wrap split">
 <aside><h2>교육 경력</h2><span>Experience</span></aside>
 <div>
  <p class="sub">다음을 포함한 여러 곳에서 교육을 진행했습니다.</p>
  <ul class="hist">
   <li>인재개발원<i>기관</i></li>
   <li>멀티캠퍼스<i>기업</i></li>
   <li>청년취업사관학교<i>기관</i></li>
   <li>세종대학교<i>대학</i></li>
   <li>삼성디스플레이<i>기업</i></li>
  </ul>
 </div>
</div></section>

<section class="sec" id="contact"><div class="wrap split">
 <aside><h2>문의하기</h2><span>Contact</span></aside>
 <form class="form" id="qf" data-to="<%= esc(CONTACT_EMAIL) %>">
  <label class="fld">문의 유형
   <select class="in" name="type"><option>개발 외주</option><option>IT 교육</option><option>기타</option></select></label>
  <fieldset class="chips"><legend>교육 문의 시 선택해 주세요</legend>
   <div class="grp"><span class="t">기간</span>
    <label><input type="checkbox" name="k" value="장기"><span>장기</span></label>
    <label><input type="checkbox" name="k" value="단기"><span>단기</span></label></div>
   <div class="grp"><span class="t">대상</span>
    <label><input type="checkbox" name="k" value="기업"><span>기업</span></label>
    <label><input type="checkbox" name="k" value="기관"><span>기관</span></label></div>
   <div class="grp"><span class="t">방식</span>
    <label><input type="checkbox" name="k" value="온라인"><span>온라인</span></label>
    <label><input type="checkbox" name="k" value="오프라인"><span>오프라인</span></label></div>
  </fieldset>
  <div class="two">
   <label class="fld">이름 / 소속<input class="in" type="text" name="nm" required></label>
   <label class="fld">연락처<input class="in" type="tel" name="tel" required></label>
  </div>
  <label class="fld">이메일<input class="in" type="email" name="em" required></label>
  <label class="fld">문의 내용<textarea class="in" name="msg" rows="5" required></textarea></label>
  <div><button class="btn" type="submit">문의 메일 보내기</button></div>
 </form>
</div></section>

<section class="sec" id="board"><div class="wrap split">
 <aside><h2>공고</h2><span>Notice</span></aside>
 <div>
  <% if (NOTICES.length == 0) { %>
   <div class="empty">등록된 공고가 없습니다.</div>
  <% } else { %>
   <table class="tbl"><thead><tr><th>번호</th><th>제목</th><th>게시일</th></tr></thead><tbody>
   <% for (int i = 0; i < NOTICES.length && i < 3; i++) { String[] n = NOTICES[i]; %>
    <tr><td class="n"><%= esc(n[0]) %></td><td><a href="<%= ctx %>/notice.jsp?id=<%= esc(n[0]) %>"><%= esc(n[1]) %></a></td><td class="d"><%= esc(n[2]) %></td></tr>
   <% } %>
   </tbody></table>
  <% } %>
  <div class="more"><span></span><a class="btn line" href="<%= ctx %>/notice.jsp">전체 공고 보기</a></div>
 </div>
</div></section>
</main>

<%@ include file="/WEB-INF/inc/footer.jspf" %>
