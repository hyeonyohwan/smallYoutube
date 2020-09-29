### .babelrc

---

[.babelrc](https://babeljs.io/docs/en/config-files/) 는 웹 스타터 킷에서 차세대 JavaScript를 작성하는데 권장되는 ES2015 트랜스 파일러인 [Babel](https://babeljs.io/) 에 옵션을 전달하기 위한 구성 파일입니다.

### .editorconfig

---

[EditorConfig](https://editorconfig.org/) 는 서로 다른 편집기와 IDE간에 일관된 코딩 스타일을 유지하기 위한 파일 형식 및 텍스트 편집기 플러그인 모음입니다.

### gulpfile.babel.js

---

[Gulp](https://gulpjs.com/) 는 지루한 개발 작업을 자동화할 수 있는 실시간 빌드 시스템입니다. Grunt와 같이 다른 빌드 시스템과 비교할 때, gulp는 작업을 자동화하는 수단으로 Node.js 스트림을 사용하므로 소스 파일을 변환할 때 중간 파일을 만들 필요가 없습니다.

gulp에서, 당신이 플러그인 설치만 잘한다면 그것들을 서로 연결하여 'pipeline'을 구성할 수 있습니다. `gulpfile` 을 사용하면 플러그인을 사용하여 축소와 같은 작업을 수행하는 작업들을 모을 수 있습니다.

`gulpfile.babel.js` 는 ES2015로 작성된 gulpfile입니다. 이름의 `babel` 부분은 ES2015 코드를 실행할 수 있도록 [Babel](https://babeljs.io/) 트랜스 파일러를 사용하는 것을 나타냅니다.

### app/scripts/main.js

---

이것은 사용자 정의 JavaScript가 이동할 수 있는 파일입니다.

### app/styles/main.css

---

이것은 사용자 정의 CSS가 이동할 수 있는 파일입니다. 컴파일하려는 모든 Sass를 `style` 디렉토리에 배치하고 `main.css` 의 이름을 `main.css` 로 바꾸면 웹 스타터 킷에서 대신 파일을 Sass로 처리합니다.

### app/manifest.json

---

`manifest.json` 에는 [Web Application Manifest](https://w3c.github.io/manifest/) (ex - 모바일 홈화면) 가 예상되는 영역에서 사용자에게 앱이 표시되는 방식을 제어하는 기능을 제공하는 간단한 JSON 파일이 포함되어 있습니다. 여기에서 사용자가 실행할 수 있는 항목과 실행 방법을 제어할 수 있습니다.

manifest에 대한 자세한 내용은 [Web Fundamentals](https://web.dev/customize-install/) 를 참조하세요.

### app/manifest.webapp

---

`manifest.webapp` 은 브라우저 간 개방형 웹 애플리케이션용으로 설계된 W3C [manifest spec](https://w3c.github.io/manifest/) 사양이 아닌 독점 [Firefox OS manifest format](https://w3c.github.io/manifest/) 형식을 나타냅니다.

Firefox OS app manifest는 앱에 대한 정보(ex - 이름, 작성자, 아이콘 및 설명) 와 앱에 필요한 웹 API 목록을 제공합니다.

이 manifest는 Firefox OS가 manifest 사양을 대신 사용하도록 전환할 때까지 웹 스타터 킷에 포함되었습니다.

### package.json

---

[package.json](https://docs.npmjs.com/files/package.json) 파일은 node 패키지 관리자인 [npm](https://www.npmjs.com/) 에서 프로젝트 도구 종속성을 지정하는데 사용됩니다. `npm install` 을 실행하면 `package.json` 을 읽어 설치해야 하는 패키지를 찾습니다.

`package.json` 에는 프로젝트 설명, 버전, 라이선스 및 구성 정보와 같은 기타 메타 데이터도 포함될 수 있습니다.

### app/service-worker.js

---

[service worker](https://developers.google.com/web/fundamentals/primers/service-workers) 는 웹 페이지와 별도로 백그라운드에서 브라우저로 실행되는 스크립트로, 오프라인 지원과 같은 기능에 대한 문을 열었습니다. 웹 스타터 킷에서 `app/service-worker.js` 스크립트는 [sw-precache](https://github.com/GoogleChromeLabs/sw-precache) 를 통한 빌드 프로세스에 의해 자동으로 생성됩니다.

