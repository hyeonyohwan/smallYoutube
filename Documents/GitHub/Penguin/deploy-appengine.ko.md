### Google App Engine에 배포

---

Google App Engine을 사용하면 Google 인프라에서 애플리케이션을 빌드하고 실행할 수 있습니다. App Engine 애플리케이션은 트래픽 및 데이터 저장소 요구사항이 변경됨에 따라 쉽게 생성, 유지관리 및 확장할 수 있습니다.

### 개발자 콘솔에서 프로젝트 만들기

---

[Google Developers Console](https://console.developers.google.com/project?pli=1) 에서:

1. 새 프로젝트 만들기
2. 프로젝트 ID를 기록 (예 : `algebraic-depot-114712` ).

### Google Cloud SDK 설치

---

https://cloud.google.com/sdk/ 에서 확인.

### 소스코드 다운로드

---

[Web Starter Kit](https://github.com/google/web-starter-kit/releases/tag/v0.6.5) 를 다운로드하여 로컬 디렉토리에 추출하십시오.

프로젝트의 루트에 `app.yaml` 이라는 새 파일을 생성하세요. 다음 내용을 붙여 넣으십시오.

```
application: algebraic-depot-114712
version: 0
runtime: php55
api_version: 1
threadsafe: false

handlers:
- url: /$
  static_files: index.html
  upload: index.html

- url: /(.*)
  static_files: \1
  upload: .*
```

App Engine에서 Web Starter Kit 프로젝트를 제공하기 위한 최소한의 구성입니다. 필요한 경우 다양한 것들은 [여기](https://github.com/h5bp/server-configs-gae/blob/master/app.yaml) 에서 사용할 수 있습니다.

### 웹-스타터-킷트 종속성 설치 (예: Node)

---

https://github.com/google/web-starter-kit/blob/master/docs/install.md 에서 확인.

### 로컬 종속성 설치 및 assets 생성

---

```
npm install
gulp
```

### 배포

---

```
cp app.yaml dist
cd dist
appcfg.py update . # "rm ~/.appcfg_oauth2_tokens" if error
```

업데이트에 실패하면 `app.yaml` 의 `application` 이 Developers Console 의 프로젝트 ID와 일치하는지 확인합니다.

모든 것이 작동하면 `<project ID>.appspot.com` (예: `https://algebraic-depot-114712.appspot.com/` ) 에서 완전히 배포된 사이트를 볼 수 있습니다.