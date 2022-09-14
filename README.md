![Dr.Trash Main Icon](https://github.com/SeoulGreenJacket/Dr.Trash-FE/blob/main/assets/drtrash/main_icon.png?raw=true)

# 친환경 지구지키미 Dr.TRASH!

분리수거 장면을 실시간으로 감시하고 평가해 올바른 분리수거를 유도하는 서비스

## ⚡️ Features

### 인공지능을 통한 올바른 분리수거

쓰레기통의 카메라로 수집한 쓰레기 버리는 모습을 인공지능에게 전송하고,
인공지능이 종류, 라벨, 잔여물 등 쓰레기의 재활용 가치를 분석합니다.

### 분리수거 포인트와 랭킹

재활용 가치가 충분한 쓰레기를 버렸다면 일정 포인트가 제공되고,
이를 통해 본인의 분리수거 등급과 랭킹을 성장시켜 재미있는 분리수거 경험을 제공합니다.

## 🐳 Deploy

### 준비해야 할 것들

- 📱 Xcode로 빌드한 Dr.TRASH가  시뮬레이터 or iOS디바이스
- [Dr.TRASH 하드웨어](https://github.com/SeoulGreenJacket/Dr.Trash-HW) 가 올라간 ESP-32 CAM
- [Docker](https://github.com/docker/docker-install)
- [Docker Compose](https://github.com/docker/compose)

### 배포하기

```shell

```

```shell
> git clone git@github.com:SeoulGreenJacket/Dr.Trash dr-trash
> cd dr-trash
> docker-compose up --build
```

## 🛠 Techs

### 🧑🏻‍💻 Frontend

|                                                             FrameWork                                                             |                                                      Platform                                                       |
|:---------------------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------:|
|                                                           React-Native                                                            |                                                         iOS                                                         |
| <img src="https://cdn4.iconfinder.com/data/icons/logos-3/600/React.js_logo-512.png" width="50px" height="50px" align="center"/> | <img src="https://icon-library.com/images/ios-download-icon/ios-download-icon-14.jpg" width="50px" height="50px"/> |

### 📡 Backend

|                                                                    FrameWork                                                                    |                                                         Server Env                                                         |
|:-----------------------------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------:|
|                                                                     Nest.js                                                                     |                                                           Docker                                                           |
|  <img src="https://images.velog.io/images/jonghyun3668/post/82a8c971-a21a-48ca-9c3e-a2a602b423f1/nestjs-logo.svg" width="50px" height="50px"/>  | <img src="https://www.docker.com/wp-content/uploads/2022/03/vertical-logo-monochromatic.png" width="50px" height="50px"/>  |

## 👨‍👩‍👧‍👦️ Crew
<table>
    <thead>
        <tr>
            <th colspan="1">AI</th>
            <th colspan="2">Front-End</th>
            <th colspan="2">Back-End</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="center"><a href="https://github.com/kacel33">김도영</a></td>
            <td align="center"><a href="https://github.com/rlarlduf20">김기열</a></td>
            <td align="center"><a href="https://github.com/CWCTBOY">박인재</a></td>
            <td align="center"><a href="https://github.com/happyjamy">김주환</a></td>
            <td align="center"><a href="https://github.com/seheon99">유세헌</a></td>
        </tr>
        <tr>
            <td><img src="https://avatars.githubusercontent.com/u/60708119?v=4" width="90px" height="90px"/></td>
            <td><img src="https://avatars.githubusercontent.com/u/29884311?v=4" width="90px" height="90px"/></td>
            <td><img src="https://avatars.githubusercontent.com/u/89184540?v=4" width="90px" height="90px"/></td>
            <td><img src="https://avatars.githubusercontent.com/u/78072370?v=4" width="90px" height="90px"/></td>
            <td><img src="https://avatars.githubusercontent.com/u/49232918?v=4" width="90px" height="90px"/></td>
        </tr>
    </tbody>
</table>

