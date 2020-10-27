### Pretty URL을 사용하여 Firebase에 배포

---

Firebase는 Web Starter Kit 사이트를 배포하는 매우 간단하고 안전한 방법입니다. 무료로 계정에 가입하고 5분 안에 애플리케이션을 배포할 수 있습니다.

아래 지침은 [Firebase hosting quick start guide](https://firebase.google.com/docs/hosting) 를 기반으로 합니다.

1. [Firebase 계정에 가입합니다](https://console.firebase.google.com/)

2. Firebase 도구 설치 명령줄

   `npm install -g firebase-tools` 

   `-g` 플래그는 모든 디렉토리에서 `firebase`  명령어를 사용할 수 있도록 패키지를 전역적으로 설치하도록 `npm` 에 지시합니다. `sudo` 권한으로 패키지를 설치해야할 수도 있습니다.

3. Firebase 계정에 로그인합니다

   `firebase login` 

4. `cd` 명령어를 이용해 당신의 프로젝트 디렉토리 가십시오

5. Firebase 응용프로그램을 초기화합니다

   `firebase init` 

   Firebase는 호스팅에 사용할 앱을 묻습니다. 방금 가입했다면 무작위로 생성된 이름의 앱이 하나 표시됩니다. 당신은 그 앱을 사용할 수 있습니다. 그렇지 않다면 https://console.firebase.google.com/ 로 이동하여 새 앱을 만들어줍니다.

6. Firebase는 앱의 공개 디렉토리 이름을 묻습니다. `dist` 를 입력하십시오. 이것은 `gulp` 를 실행하여 애플리케이션을 빌드할 때 WSK가 모든 것을 빌드하고 모두 `dist` 에 배치하기 때문에 작동합니다. 따라서 `dist` 에는 애플리케이션 실행에 필요한 모든 것이 포함되어 있습니다.

7. 빌드

   `gulp` 

8. 배포

   `firebase deploy` 

   라이브 사이트의 URL이 출력에 나열됩니다.

   https://web-starter-kit.firebaseapp.com/ 에서 배포된 WSK 버전을 확인할 수 있습니다.

