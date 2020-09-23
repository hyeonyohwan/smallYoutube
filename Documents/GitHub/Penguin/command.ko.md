사이트를 구축하고 테스트하는데 도움이 되는 많은 명령어들이 있습니다. 다음은 시작할 때 주의해야할 사항들입니다.

### 변경사항을 확인 & 자동으로 장치를 새로고침

```
$ gulp serve
```

위와 같이 하면 로컬 테스트에 사용할 수 있는 IP주소와 네트워크에 연결된 장치에서 사용할 수 있는 다른 IP주소가 출력됩니다. `seve` 는 서비스 워커 캐싱을 사용하지 않으므로 웹 서버가 실행을 중지하면 사이트 사용이 중지됩니다.

### 구축 및 최적화

```
$ gulp
```

배포할 준비가 된 현재 프로젝트를 빌드하고 최적화합니다. 여기에는 이미지, 스크립트, 스타일시트, HTML 최적화 및 축소뿐만 아니라 린팅도 포함됩니다. 또한 [service worker](https://developers.google.com/web/fundamentals/primers/service-workers) 스크립트가 자동으로 생성되어 사이트의 자원을 미리 캐싱합니다. 서비스 워커를 [support](https://jakearchibald.github.io/isserviceworkerready/) 지원하는 브라우저에서 사이트는 서버를 우회하여 서비스 워커 캐시에서 직접 로드됩니다. 즉. 이 버전의 사이트는 서버가 실행 중이 아니거나 네트워크 연결이 없을 때 작동합니다.

### 완벽한 구축 및 최적화된 사이트

```
$ gulp serve:dist
```

위와 같이 하면 로컬 테스트에 사용할 수 있는 IP주소와 네트워크에 연결된 장치에서 사용할 수 있는 다른 IP주소가 출력됩니다. `serve:dist` 포함된 것들은 `default`  작업의 일부로 생성되고 최적화된 사이트의 로컬 사본을 제공합니다. 최적화된 사이트에는 캐시에서 직접 사이트를 제공하는 서비스 워커가 포함되어 있으므로 최신 변경사항을 적용하려면 사이트를 다시 생성한 후 페이지를 새로고침해야합니다. `serve:dist` 는 `serve` 와 다른 HTTP 포트를 사용하므로 서비스 워커가 다른 [scopes](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers#Registering_your_worker) 에서 격리된 상태로 유지됩니다.

### `serve` 와 `serve:dist` 의 차이점

`serve` 와 `serve:dist` 작업의 차이점을 확인하는 것은 중요합니다.

+ `serve` 는 no-op `service-worker.js` 를 사용하며 오프라인으로 실행할 수 없습니다.
+  `serve:dist` 는 `sw-precache` 생성 출력을 사용하며 오프라인으로 실행할 수 있습니다.

`serve` 작업은 포트 3000에서 실행되고 `serve:dist`  는 포트 3001에서 실행됩니다. 주요 목적은 서로 다른 서비스 워커가 서로의 환경에 영향을 미치지 않도록 하는 것입니다. `sw-precache`  생성 출력을 사용하면 개발 서버 환경에 적합하지 않은 로컬 변경 사항을 빠르게 테스트하기가 매우 어렵습니다.

### 성능 확인

```
$ gulp pagespeed
```

[PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) API에 대해 사이트의 배포된 (public) 버전을 실행하여 개선할 수 있는 부분을 파악할 수 있습니다.

