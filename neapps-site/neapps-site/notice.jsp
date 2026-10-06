<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/inc/site.jspf" %>
<%
 String id = request.getParameter("id");
 String[] cur = (id == null) ? null : find(id);
 if (id != null && cur == null) response.setStatus(404);
 String pageTitle = (cur != null) ? cur[1] : "공고 게시판";
 String active = "notice";
%>
<%@ include file="/WEB-INF/inc/header.jspf" %>

<main>
<div class="pagehead"><div class="wrap">
 <h1>공고 게시판</h1>
 <p><%= esc(CO_KO) %>의 전자공고 게시판입니다.</p>
</div></div>

<section class="sec"><div class="wrap">
<% if (cur != null) { %>
 <article class="notice">
  <div class="hd">
   <h1><%= esc(cur[1]) %></h1>
   <div class="meta"><span>게시일 <%= esc(cur[2]) %></span><span>게시기간 <%= esc(cur[3]) %></span></div>
  </div>
  <div class="bd">
   <% for (String p : cur[4].split("\\|\\|")) { %><p><%= esc(p) %></p><% } %>
   <div class="sign"><% for (String s : cur[5].split("\\|\\|")) { %><%= esc(s) %><br><% } %></div>
  </div>
 </article>
 <div class="act">
  <a class="btn line" href="<%= ctx %>/notice.jsp">목록으로</a>
  <button class="btn line" type="button" onclick="window.print()">인쇄 / PDF 저장</button>
 </div>
<% } else if (id != null) { %>
 <div class="empty">요청하신 공고를 찾을 수 없습니다.<br><br><a class="btn line" href="<%= ctx %>/notice.jsp">목록으로</a></div>
<% } else if (NOTICES.length == 0) { %>
 <div class="empty">등록된 공고가 없습니다.</div>
<% } else { %>
 <table class="tbl"><thead><tr><th>번호</th><th>제목</th><th>게시일</th></tr></thead><tbody>
 <% for (String[] n : NOTICES) { %>
  <tr><td class="n"><%= esc(n[0]) %></td><td><a href="<%= ctx %>/notice.jsp?id=<%= esc(n[0]) %>"><%= esc(n[1]) %></a></td><td class="d"><%= esc(n[2]) %></td></tr>
 <% } %>
 </tbody></table>
<% } %>
</div></section>
</main>

<%@ include file="/WEB-INF/inc/footer.jspf" %>
