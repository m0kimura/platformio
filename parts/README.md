## 注意

 - 実行するには1st:プロジェクトホルダ、2nd:モジュール、3rd:オペレーションを指定します。
 - ホルダ構造は,{project}/platformio/{module}/src/ソース
 - docker.shの引数は下記のようになります。　最初は「デバイスモデル」を指定して、初期化します.

### オペレーション

|オペレーション     |説明
|「デバイスモデル」  |初期化
|build          |ソースをコンパイルします.
|upload         |ソースをコンパイル後、デバイスにアップロードします。
|clean          |コンパイル環境をクリアします
|boards         |デバイスモデルをリストアップします。

### 例

1. ./docker.sh      // このヘルプが表示されて、ターミナルになる
2. ./docker.sh boards // ボードの一覧が表示される
3. ./docker.sh home-project module espre
4. ./docker.sh home-project module upload // コンパイル後アップロードする
5. ./docker.sh debug // デバッグ用にUSBのTTYターミナルが起動される

### ボードID例

|node mcu v2  |nodemcuv2    |
|arduino uno  |uno          |
|arduino nano |nanoatmega328|
|nodemcu-32s  |nodemcu-32s  |
