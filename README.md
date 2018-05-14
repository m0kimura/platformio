PlatformioによるArduino,ESP8266などのマイコンの構築環境Docker
====

Platformioをつかってマイコンのアプリ開発、デバッグを行う環境をDockerで提供します。


## 説明
  - platformioを使ってコンパイル、アップロードができます。
  - デバッグようにUSB Serial Terminalが起動できます。

## 必要事項
  Dockerがインストールされている必要があります。

## 構成
  - Dockerfile ドッカー構築ファイル
  - README.md 解説
  - docker.sh ドッカー起動、管理シェル
  - starter.sh 開始時実行ソース
  - parts/template.ino 簡単なテンプレート

## 使い方
### 注意

   - 実行するには1st:プロジェクトホルダ、2nd:モジュール、3rd:オペレーションを指定します。
   - ホルダ構造は,{project}/platformio/{module}/src/ソース
   - docker.shの引数は下記のようになります。　最初は「デバイスモデル」を指定して、初期化します.

### オペレーション

  |オペレーション     |説明|
  |:-|:-|
  |「デバイスモデル」  |初期化|
  |build          |ソースをコンパイルします.|
  |upload         |ソースをコンパイル後、デバイスにアップロードします。|
  |clean          |コンパイル環境をクリアします|
  |boards         |デバイスモデルをリストアップします。|

### 例

  1. ./docker.sh      // このヘルプが表示されて、ターミナルになる
  2. ./docker.sh boards // ボードの一覧が表示される
  3. ./docker.sh home-project module espre
  4. ./docker.sh home-project module upload // コンパイル後アップロードする
  5. ./docker.sh debug // デバッグ用にUSBのTTYターミナルが起動される

### ボードID例

  |ボード|指定|
  |:-|:-|
  |node mcu v2  |nodemcuv2    |
  |arduino uno  |uno          |
  |arduino nano |nanoatmega328|
  |nodemcu-32s  |nodemcu-32s  |


### インストール
  git clone https://github.com/m0kimura/platformio.git


## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)


## Author

[m0kimura](https://github.com/m0kimura)
[サイト](https://www.kmrweb.net/)

