### 설치

---

[WSK를 다운로드](https://github.com/google/web-starter-kit/releases/tag/v0.6.5) 하고 해당 디렉토리에서 `npm install --global gulp && npm install` 을 실행하여 시작하십시오.

---

웹 스타터 킷을 활용하려면 다음이 필요합니다.

1. 코드를 복사하십시오.
2. 만약 종속성을 가지고 있지 않다면 종속성을 설치하십시오.
3. 원하는대로 응용프로그램을 수정하십시오.
4. 프로덕션 코드를 배포합니다.

### 코드 가져오기

---

작업하려는 위치에 [WSK를 다운로드](https://github.com/google/web-starter-kit/releases/tag/v0.6.5) 하고 압축을 풉니다.

### 전제조건

---

#### [Node.js](https://nodejs.org/en/) 

터미널을 열고 `node --version` 을 입력합니다. Node는 0.10.x 이상의 버전이어야 합니다. Node가 필요한 경우 [nodejs.org](https://nodejs.org/en/) 로 이동하여 큰 녹색 설치 버튼을 클릭하십시오.

#### [Gulp](https://gulpjs.com/)

터미널을 열고 `gulp --version` 을 입력합니다. Gulp가 설치되어 있다면 3.9.x 이상의 버전 번호를 반환해야 합니다. Gulp를 설치 / 업그레이드해야하는 경우 터미널을 열고 다음을 입력하십시오:

`$ npm install --global gulp`

이 코드는 Gulp를 전역적으로 설치합니다. 사용자 계정에 따라 관리자 권한 없이 패키지를 전역적으로 설치하도록 [시스템을 구성](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md) 해야할 수 있습니다.

### 지역 종속성

다음으로, 웹 스타터 킷에 필요한 지역 종속성을 설치합니다:

`$ npm install`

참고: 만약 [Yarn](https://yarnpkg.com/) 패키지 관리자가 설치되어 있는 경우 `yarn` 을 실행할 수 있습니다. 웹 스타터 킷에는 여기서 사용될 yarn.lock 파일이 포함되어 있습니다.

이게 다입니다! 이제 웹 스타터 킷을 사용하는데 필요한 모든 것이 준비되었습니다.

---

사용 가능한 일부 [명령어](https://github.com/google/web-starter-kit/blob/master/docs/commands.md) 에 익숙해지기를 원하실 수 있습니다.