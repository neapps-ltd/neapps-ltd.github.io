(function () {
  var S = window.SITE, page = document.body.getAttribute("data-page") || "";
  function $(s) { return document.querySelector(s); }
  function h(tag, cls, txt) { var e = document.createElement(tag); if (cls) e.className = cls; if (txt != null) e.textContent = txt; return e; }

  /* 헤더 */
  var hdr = $("#hdr");
  if (hdr) {
    var w = h("div", "wrap"), logo = h("a", "logo"), b = h("b");
    logo.href = "index.html";
    b.appendChild(document.createTextNode("NE")); b.appendChild(h("i", "", "APPS"));
    logo.appendChild(b); logo.appendChild(h("small", "", S.ko));
    var nav = h("nav", "gnb"); nav.setAttribute("aria-label", "주요 메뉴");
    [["회사소개", "index.html#about"], ["사업분야", "index.html#biz"], ["교육 경력", "index.html#edu"], ["문의", "index.html#contact"], ["공고", "notice.html"]].forEach(function (l) {
      var a = h("a", "", l[0]); a.href = l[1];
      if (l[1] === "notice.html" && page === "notice") a.setAttribute("aria-current", "page");
      nav.appendChild(a);
    });
    w.appendChild(logo); w.appendChild(nav); hdr.appendChild(w);
  }

  /* 푸터 */
  var ftr = $("#ftr");
  if (ftr) {
    var fw = h("div", "wrap"), l1 = h("div");
    l1.appendChild(h("b", "", S.ko + " (" + S.en + ")"));
    l1.appendChild(document.createTextNode("대표자 " + S.ceo + " · 사업자등록번호 " + S.bizNo));
    l1.appendChild(h("br"));
    l1.appendChild(document.createTextNode(S.addr + " · " + S.tel + " · " + S.email));
    l1.appendChild(h("small", "", "© " + new Date().getFullYear() + " " + S.en + " All rights reserved."));
    var l2 = h("div"), fa = h("a", "", "공고 게시판"); fa.href = "notice.html"; l2.appendChild(fa);
    fw.appendChild(l1); fw.appendChild(l2); ftr.appendChild(fw);
  }

  /* 공고 목록 표 */
  function table(list) {
    var t = h("table", "tbl"), r = h("tr");
    ["번호", "제목", "게시일"].forEach(function (x) { r.appendChild(h("th", "", x)); });
    t.appendChild(h("thead")).appendChild(r);
    var tb = h("tbody");
    list.forEach(function (n) {
      var tr = h("tr"), td = h("td"), a = h("a", "", n.title);
      a.href = "notice.html?id=" + encodeURIComponent(n.id);
      td.appendChild(a);
      tr.appendChild(h("td", "n", n.id)); tr.appendChild(td); tr.appendChild(h("td", "d", n.date));
      tb.appendChild(tr);
    });
    t.appendChild(tb); return t;
  }
  function empty(msg) { return h("div", "empty", msg); }

  var prev = $("#notice-preview");
  if (prev) prev.appendChild(S.notices.length ? table(S.notices.slice(0, 3)) : empty("등록된 공고가 없습니다."));

  /* 공고 게시판 페이지 */
  var root = $("#notice-root");
  if (root) {
    var id = new URLSearchParams(location.search).get("id");
    if (!id) {
      root.appendChild(S.notices.length ? table(S.notices) : empty("등록된 공고가 없습니다."));
    } else {
      var n = S.notices.filter(function (x) { return String(x.id) === id; })[0];
      if (!n) {
        var e = empty("요청하신 공고를 찾을 수 없습니다."); root.appendChild(e);
      } else {
        document.title = n.title + " | " + S.ko + " (" + S.en + ")";
        var art = h("article", "notice"), hd = h("div", "hd"), bd = h("div", "bd"), meta = h("div", "meta");
        hd.appendChild(h("h1", "", n.title));
        meta.appendChild(h("span", "", "게시일 " + n.date)); meta.appendChild(h("span", "", "게시기간 " + n.period));
        hd.appendChild(meta);
        n.body.forEach(function (p) { bd.appendChild(h("p", "", p)); });
        var sg = h("div", "sign");
        n.sign.forEach(function (s) { sg.appendChild(document.createTextNode(s)); sg.appendChild(h("br")); });
        bd.appendChild(sg); art.appendChild(hd); art.appendChild(bd); root.appendChild(art);
        var act = h("div", "act"), back = h("a", "btn line", "목록으로"), pr = h("button", "btn line", "인쇄 / PDF 저장");
        back.href = "notice.html"; pr.type = "button"; pr.onclick = function () { window.print(); };
        act.appendChild(back); act.appendChild(pr); root.appendChild(act);
      }
    }
  }

  /* 문의 폼 */
  var f = $("#qf");
  if (f) {
    var st = $("#qst"), btn = f.querySelector("button[type=submit]");
    function say(msg, cls) { st.textContent = msg; st.className = "status" + (cls ? " " + cls : ""); }
    f.addEventListener("submit", function (e) {
      e.preventDefault();
      if (f.elements._gotcha.value) return; /* 스팸 방지용 숨김 칸 */
      var k = Array.prototype.map.call(f.querySelectorAll("input[name=k]:checked"), function (x) { return x.value; }).join(", ") || "선택 없음";
      var g = function (n) { return f.elements[n].value; };
      var cfg = S.form || {};
      var data = { _subject: "[홈페이지 문의] " + g("type"), type: g("type"), conditions: k, name: g("nm"), phone: g("tel"), email: g("em"), message: g("msg") };

      if (!cfg.endpoint) { /* 전송 서비스 미설정: 메일 작성 창으로 대체 */
        var body = "유형: " + data.type + "\n교육 조건: " + k + "\n이름/소속: " + data.name + "\n연락처: " + data.phone + "\n이메일: " + data.email + "\n\n" + data.message;
        location.href = "mailto:" + S.email + "?subject=" + encodeURIComponent(data._subject) + "&body=" + encodeURIComponent(body);
        return;
      }
      btn.disabled = true; say("전송 중입니다...", "");
      var payload = {}; [cfg.extra || {}, data].forEach(function (o) { for (var key in o) payload[key] = o[key]; });
      fetch(cfg.endpoint, { method: "POST", headers: { "Content-Type": "application/json", "Accept": "application/json" }, body: JSON.stringify(payload) })
        .then(function (r) { if (!r.ok) throw new Error("http"); return r.json().catch(function () { return {}; }); })
        .then(function (j) { if (j && (j.success === false || j.ok === false)) throw new Error("svc"); f.reset(); say("문의가 접수되었습니다. 확인 후 연락드리겠습니다.", "ok"); })
        .catch(function () { say("전송에 실패했습니다. " + S.email + " 로 직접 보내 주세요.", "err"); })
        .then(function () { btn.disabled = false; });
    });
  }
})();
