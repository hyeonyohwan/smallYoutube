### 웹 스타터 킷에서 Material Design Lite 의 Sass 사용

---

보다 커스터마이징이 가능한 [Sass](https://sass-lang.com/) 버전을 위해 [Material Design Lite](https://getmdl.io/) 의 CSS 버전을 교체하려는 경우 웹 스타터 킷을 사용하여 이 설정을 얻기 위해 할 수 있는 몇 가지 단계가 있습니다.

> 이 지침은 Web Starter Kit 0.6.0 이상에서 사용하기 위한 것입니다.

				1. 웹 스타터 킷의 [최신 릴리즈](https://github.com/google/web-starter-kit/releases/tag/v0.6.5) 를 다운로드하십시오. 드라이브의 위치에 압축을 푸십시오.
   				2. Material Design Lite(`material-design-lite-<version>.zip`  의 [최신 릴리즈](https://github.com/google/material-design-lite/releases/tag/v1.3.0) 빌드를 다운로드합니다. 여기서 `version` 은 사용 가능한 최신 버전임). 이 파일에는 시작하는데 필요한 Sass 소스 파일이 포함됩니다.
   				3. `material-design-lite-<version>.zip` 을 드라이브의 로컬 폴더에 추출하고 열어줍니다. 아래와 유사한 파일 / 폴더 구조가 표시되어야 합니다.

```
├── LICENSE
├── README.md
├── bower.json
├── gulpfile.js
├── material.css
├── material.js
├── material.min.css
├── material.min.css.map
├── material.min.js
├── material.min.js.map
├── package.json
├── src
└── utils
```

​		위의 `src` 디렉토리에는 MDL의 Sass 파일과 모든 MDL 구성 요소에 대한 JavaScript 소스가 포		함되어 있습니다.

4. 3단계의 `src` 디렉토리를 웹 스타터 킷의 `app/styles` 디렉토리로 복사합니다. 이제 `app/styles 의 폴더 구조가 다음과 유사해야 합니다.

```
├── main.css
└── src
```

​		다음으로 웹 스타터 킷의 `app/index.html` 에 대한 몇가지 변경 사항이 있습니다. 기본적으로 		Material Design Lite 의 CDN 호스팅 프로덕션 빌드가 포함됩니다. 대신 로컬 파일에 대한 참조를 		위해 이를 교체해야 합니다.

5. 먼저 CDN 호스팅 스타일시트를 로컬 버전으로 전환합니다.

다음 줄을 

```
<link rel="stylesheet" href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css">
```

아래 줄로 교체합니다:

```
<link rel="stylesheet" href="styles/main.css">
```

텍스트 편집기(예 : Sublime Text) 에서 "app/styles/main.css" 로 이동하면 이미 일부 스타일이 포함되어 있음을 알 수 있습니다. 이는 웹 스타터 킷과 함께 제공되는 기본 템플릿 용입니다.

웹 스타터 킷에서 이 파일을 Sass 파일로 취급하도록 `app/styles/main.css` 파일의 이름을 `app/styles/main.scss` 로 변경하겠습니다. `app/index.html` 은 더이상 변경할 필요가 없습니다.

Sass 작동을 위한 마지막 변경사항 중 하나는 `app/styles/main.scss` 맨 위에 다음 줄을 추가하는 것입니다 : 

```
@import "src/material-design-lite";
```

이것은 MDL의 모든 구성 요소 스타일을 가져옵니다. 나중에 작은 구성 요소 세트만 사용하기로 결정한 경우 `src/material-design-lite.scss` 를 편집하여 원하지 않는 부분을 주석 처리하십시오.

6. 다음으로 MDL 용 JavaScript 파일을 불러옵니다. 다시 한번 `app/index.html` 을 편집합니다 : 

아래줄을 제거합니다 : 

```
<script src="https://code.getmdl.io/1.2.1/material.min.js"></script>
```

그리고 `app/index.html` 에서 아래 블록을 찾습니다 : 

```
    <!-- build:js(app/) ../../scripts/main.min.js -->
    <script src="scripts/main.js"></script>
    <!-- endbuild -->
```

위의 블록을 다음 코드로 바꿉니다 : 

```
<!-- build:js(app/) ../../scripts/main.min.js -->
    <script src="./styles/src/mdlComponentHandler.js"></script>
    <script src="./styles/src/button/button.js"></script>
    <script src="./styles/src/checkbox/checkbox.js"></script>
    <script src="./styles/src/icon-toggle/icon-toggle.js"></script>
    <script src="./styles/src/menu/menu.js"></script>
    <script src="./styles/src/progress/progress.js"></script>
    <script src="./styles/src/radio/radio.js"></script>
    <script src="./styles/src/slider/slider.js"></script>
    <script src="./styles/src/spinner/spinner.js"></script>
    <script src="./styles/src/switch/switch.js"></script>
    <script src="./styles/src/tabs/tabs.js"></script>
    <script src="./styles/src/textfield/textfield.js"></script>
    <script src="./styles/src/tooltip/tooltip.js"></script>
    <script src="./styles/src/layout/layout.js"></script>
    <script src="./styles/src/data-table/data-table.js"></script>
    <script src="./styles/src/ripple/ripple.js"></script>
    <script src="scripts/main.js"></script>
    <!-- endbuild -->
```

그 다음, `gulpfile.babel.js` (웹 스타터 킷의 루트에 있음) 에서 `scripts` 작업을 편집하십시오. 기본적으로 다음과 같이 표시됩니다 : 

```
gulp.task('scripts', () =>
    gulp.src([
      // Note: Since we are not using useref in the scripts build pipeline,
      //       you need to explicitly list your scripts here in the right order
      //       to be correctly concatenated
      './app/scripts/main.js'
    ])
```

`gulp` 를 실행할 때 올바르게 복사되고 빌드로 축소되도록 MDL 구성 요소 스크립트를 추가할 것입니다.

```
gulp.task('scripts', () =>
    gulp.src([
      // Component handler
      './app/styles/src/mdlComponentHandler.js',
      // Base components
      './app/styles/src/button/button.js',
      './app/styles/src/checkbox/checkbox.js',
      './app/styles/src/icon-toggle/icon-toggle.js',
      './app/styles/src/menu/menu.js',
      './app/styles/src/progress/progress.js',
      './app/styles/src/radio/radio.js',
      './app/styles/src/slider/slider.js',
      './app/styles/src/spinner/spinner.js',
      './app/styles/src/switch/switch.js',
      './app/styles/src/tabs/tabs.js',
      './app/styles/src/textfield/textfield.js',
      './app/styles/src/tooltip/tooltip.js',
      // Complex components (which reuse base components)
      './app/styles/src/layout/layout.js',
      './app/styles/src/data-table/data-table.js',
      // And finally, the ripples
      './app/styles/src/ripple/ripple.js',
      // Other scripts,
      './app/scripts/main.js'
    ])
```

> 참고 : 위의 파이프 라인에서 동일한 소스 파일 세트를 2번 참조하는 것이 약간 차선책이라고 느낄 수 있습니다. 향후 릴리즈에서 이 워크플로를 단순화할 것입니다.

스타일과 마찬가지로 더 작은 구성 요소 집합만 사용하기로 결정한 경우 여기에서 필요하지 않은 항목을 주석 처리할 수 있습니다.

7. 마지막으로 `gulp serve` 를 실행하여 사이트를 미리 보거나 `gulp` 를 실행하여 프로덕션 버전을 빌드할 수 있습니다. 꺄!

## 보너스 팁

---

### 색상 구성

MDL에서 사용되는 색상 테마를 구성하고 싶을 것입니다.

MDL은 Sass 변수를 통해 Material Deisign의 [color palette](https://material.io/design/color/the-color-system.html#color-color-palette)  를  지원합니다.

사용하려는 팔레트 사양에서 색상을 찾으면 (예 : 색상명 `pink` with fill `500` ), MDL은 이를 `$palette-pink-500` 으로 보여줍니다. 테마에 대한 기본 및 강조 색상을 커스터마이징하는 방법을 살펴 보겠습니다.

다음과 같이 설정하여 수행할 수 있습니다 : 

1. `gulp serve` 를 실행하여 사이트를 미리 봅니다.
2. 텍스트 편집기에서 `app/styles/src/_variables.scss` 를 열어줍니다.
3. `$color-primary` 를 찾아줍니다. 테마에 사용할 수 있는 다른 2가지 색상 변수인 `$color-primary-dark` 및 `$color-accent` 와 동일한 블록에 있어야합니다.

```
$color-primary: $palette-indigo-500 !default;
$color-primary-dark: $palette-indigo-700 !default;
$color-accent: $palette-pink-A200 !default;
```

사용 가능한 [Material Design color themes](https://material.io/design/color/the-color-system.html) 에 대해 `app/styles/src/_color-definitions.scss` 를 참조하여 사용자 지정 테마의 기본 테마를 변경할 수 있습니다.

이 예제에서는, `palette-purple-500` 의 경우 `palette-indigo-500` 를, `palette-deep-purple-700` 의 경우 `palette-indigo-700` 으로 변경하겠습니다.

```
$color-primary: $palette-purple-500 !default;
$color-primary-dark: $palette-deep-purple-700 !default;
$color-accent: $palette-pink-A200 !default;
```

위의 변경을 수행하고 저장을 누르십시오. 페이지가 새로고침되고 이제 사용자 정의된 테마가 실제로 표시됩니다.

완전한 Material Design 테마의 경우, 동일한 `app/styles/src/_variables.scss` 파일에서 `$color-primary-contrast` 및 `$color-accent-contrast` 의 2가지 다른 색상을 설정해야합니다. 이들은 각각 기본 또는 강조된 단색 블록 위에 렌더링되는 텍스트의 색상입니다. 어두운 기본 / 악센트를 선택한 경우 `$color-dark-contrast` 로 설정하고 밝은 기본 / 악센트를 선택한 경우 `$color-light-contrast` 로 설정해야합니다.