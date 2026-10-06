NE APPS Ltd. 정적 홈페이지 (GitHub Pages용)

[파일] index.html, notice.html, style.css, site.js, main.js  (모두 같은 위치에 올리기)
[수정] 회사 정보, 이메일, 공고, 문의 전송 설정은 site.js 한 파일에서 고칩니다.
[공고 주소] https://사용자명.github.io/notice.html?id=1

[문의 폼이 실제로 메일을 보내게 하려면]
정적 사이트는 스스로 메일을 보낼 수 없어 외부 폼 서비스가 필요합니다.
A) Formspree: 가입 -> New Form -> 받을 이메일 입력 -> 발급된 주소를 site.js 의
   form.endpoint 에 입력 (extra 는 {} 그대로)
B) Web3Forms: 이메일 입력 -> 받은 Access Key 를 site.js 의
   form: { endpoint: "https://api.web3forms.com/submit", extra: { access_key: "키" } }
endpoint 를 비워 두면 메일 작성 창이 열리는 방식으로 동작합니다.
