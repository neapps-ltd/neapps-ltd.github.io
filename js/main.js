/* 문의 폼: 입력 내용을 메일 작성 창으로 넘깁니다. 수신 주소는 site.jspf의 CONTACT_EMAIL */
(function(){
 var f=document.getElementById("qf"); if(!f) return;
 f.addEventListener("submit",function(e){
  e.preventDefault();
  var k=[].map.call(f.querySelectorAll("input[name=k]:checked"),function(x){return x.value}).join(", ")||"선택 없음";
  var g=function(n){return f.elements[n].value};
  var body="유형: "+g("type")+"\n교육 조건: "+k+"\n이름/소속: "+g("nm")+"\n연락처: "+g("tel")+"\n이메일: "+g("em")+"\n\n"+g("msg");
  location.href="mailto:"+f.dataset.to+"?subject="+encodeURIComponent("[홈페이지 문의] "+g("type"))+"&body="+encodeURIComponent(body);
 });
})();
