-프로젝트 개요- 이 프로젝트는 Unity, Unity Relay/Lobby 서비스, Docker를 활용하여 제작된 실시간 멀티플레이어 프로젝트입니다
* Unity 기반의 Netcode를 통해 복수 플레이어 동기화
* Relay 및 Lobby 서비스를 통해 로비 생성 및 플레이어 매칭 구현
* Docker를 이용해 WebGL 빌드를 자동화
* Unity Cloud Build를 통해 브라우저에서 실행 가능한 빌드 생성
현재 Unity 에디터 상에서는 멀티플레이 기능이 정상 작동하지만, WebGL 빌드에서는 Relay 연결 관련 문제(예: RelayServerData 생성 오류, WebSocket 연결 문제 등)로 인해 게임이 정상 실행되지 않는 이슈가 발생하기 때문에 예제 싱글플레이게임을 웹버전으로 빌드해서 배포하였습니다.


-사용한 클라우드 및 도커 기능- 1.Docker Unity CLI를 활용한 WebGL 빌드 환경 구성 및 Nginx 배포 환경 설정
2.Unity Relay NAT 환경에서도 가능한 실시간 네트워크 연결 지원 (WebSocket 기반)
3.Unity Lobby 매치메이킹을 위한 로비 생성 및 동기화 기능 구현 

-예제 싱글플레이어 프로젝트 실행 순서-
1. docker pull smallhand/corgi-docker:latest
2. docker run -d -p 8080:80 --name corgi-docker-container smallhand/corgi-docker:latest
3. http://localhost:8080 로 접속
   
-멀티플레이어 프로젝트 실행 순서(정상실행불가능)-
1. Git 저장소 클론 git clone https://github.com/nam12130h/CloudUnity.git cd CloudUnity
2. Docker 이미지 빌드 docker build -t unity-webgl .
3. Docker 컨테이너 실행 docker run -d -p 8080:80 --name unity-webgl-container unity-webgl
4. 웹 브라우저에서 실행 확인 http://localhost:8080 로 접속
5. 다른 포트로 실행 (포트 충돌 시) docker run -d -p 9090:80 --name unity-webgl-alt unity-webgl
