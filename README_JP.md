<div align="center">

<img alt="hivision_logo" src="assets/hivision_logo.png" width=120 height=120>
<h1>HivisionIDPhoto</h1>

[English](README_EN.md) / [中文](README.md) / 日本語 / [한국어](README_KO.md)

[![][release-shield]][release-link]
[![][dockerhub-shield]][dockerhub-link]
[![][github-stars-shield]][github-stars-link]
[![][github-issues-shield]][github-issues-link]
[![][github-contributors-shield]][github-contributors-link]
[![][github-forks-shield]][github-forks-link]
[![][license-shield]][license-link]  
[![][wechat-shield]][wechat-link]
[![][spaces-shield]][spaces-link]
[![][swanhub-demo-shield]][swanhub-demo-link]

[![][trendshift-shield]][trendshift-link]
[![][hellogithub-shield]][hellogithub-link]

<img src="assets/demoImage.png" width=900>

</div>

<br>

> **関連プロジェクト**：
>
> - [SwanLab](https://github.com/SwanHubX/SwanLab)：人物切り抜きモデルの訓練を通じて、分析と監視、ラボの仲間との協力と交流を行い、訓練効率を大幅に向上させました。

<br>

# 目次

- [最近の更新](#-最近の更新)
- [プロジェクト概要](#-プロジェクト概要)
- [コミュニティ](#-コミュニティ)
- [準備作業](#-準備作業)
- [デモの起動](#-デモの起動)
- [Python推論](#-python推論)
- [APIサービスのデプロイ](#️-APIサービスのデプロイ)
- [Dockerデプロイ](#-dockerデプロイ)
- [お問い合わせ](#-お問い合わせ)
- [貢献者](#貢献者)

<br>

# 🤩 最近の更新

- オンライン体験： [![SwanHub Demo](https://img.shields.io/static/v1?label=Demo&message=SwanHub%20Demo&color=blue)](https://swanhub.co/ZeYiLin/HivisionIDPhotos/demo)、[![Spaces](https://img.shields.io/badge/🤗-Open%20in%20Spaces-blue)](https://huggingface.co/spaces/TheEeeeLin/HivisionIDPhotos)

- 2024.09.09: 新しい**切り抜きモデル** [BiRefNet-v1-lite](https://github.com/ZhengPeng7/BiRefNet) を追加 | Gradioに高度なパラメーター設定タブを追加
- 2024.09.08: 新しい**切り抜きモデル** [RMBG-1.4](https://huggingface.co/briaai/RMBG-1.4) を追加 | **ComfyUIワークフロー** - [HivisionIDPhotos-ComfyUI](https://github.com/AIFSH/HivisionIDPhotos-ComfyUI) AIFSHによる貢献
- 2024.09.07: **顔検出APIオプション** [Face++](docs/face++_EN.md) を追加し、より高精度な顔検出を実現
- 2024.09.06: 新しい切り抜きモデル [modnet_photographic_portrait_matting.onnx](https://github.com/ZHKKKe/MODNet) を追加
- 2024.09.05: [Restful API ドキュメント](docs/api_EN.md) を更新
- 2024.09.02: **写真のKBサイズを調整**を更新、[DockerHub](https://hub.docker.com/r/linzeyi/hivision_idphotos/tags)
- 2023.12.01: **APIデプロイ（fastapiベース）**を更新

<br>

# プロジェクト概要

> 🚀 私たちの仕事に興味を持っていただきありがとうございます。画像分野における他の成果もぜひご覧ください。お問い合わせは、zeyi.lin@swanhub.co まで。

HivisionIDPhotoは、実用的で体系的な証明写真のスマート制作アルゴリズムを開発することを目的としています。

さまざまなユーザー撮影シーンの認識、切り抜きおよび証明写真の生成を実現するために、一連の洗練されたAIモデル作業フローを利用しています。

**HivisionIDPhotoは以下のことができます：**

1. 軽量切り抜き（完全オフラインで、**CPU**のみで迅速に推論可能）
2. 異なるサイズ仕様に基づいて異なる標準証明写真、六寸レイアウト写真を生成
3. 完全オフラインまたはエッジクラウド推論をサポート
4. 美顔（待機中）
5. スマートな正装変更（待機中）

<div align="center">
<img src="assets/demo.png" width=900>
</div>

---

HivisionIDPhotoがあなたに役立つ場合は、このリポジトリをスターしたり、友人に推薦したりして、証明写真の緊急制作の問題を解決してください！

<br>

# 🏠 コミュニティ

私たちは、コミュニティによって構築されたHivisionIDPhotosの興味深いアプリケーションや拡張機能をいくつか共有しています：

- [HivisionIDPhotos-windows-GUI](https://github.com/zhaoyun0071/HivisionIDPhotos-windows-GUI)：Windowsクライアントアプリケーション、[zhaoyun0071](https://github.com/zhaoyun0071)によって構築されました
- [HivisionIDPhotos-ComfyUI](https://github.com/AIFSH/HivisionIDPhotos-ComfyUI)：ComfyUI証明写真処理ワークフロー、[AIFSH](https://github.com/AIFSH/HivisionIDPhotos-ComfyUI)によって構築されました 

[![](assets/comfyui.png)](https://github.com/AIFSH/HivisionIDPhotos-ComfyUI)

<br>

# 🔧 準備作業

環境のインストールと依存関係：
- Python >= 3.7（プロジェクトは主にpython 3.10でテストされています）
- OS: Linux, Windows, MacOS

## 1. プロジェクトをクローンする

```bash
git clone https://github.com/Zeyi-Lin/HivisionIDPhotos.git
cd  HivisionIDPhotos
```

## 2. 依存環境をインストールする

> condaでpython3.10の仮想環境を作成することをお勧めします。その後、以下のコマンドを実行してください。

```bash
pip install -r requirements.txt
pip install -r requirements-app.txt
```

## 3. 重みファイルをダウンロードする

**方法一：スクリプトでダウンロード**

```bash
python scripts/download_model.py --models all
```

**方法二：直接ダウンロード**

プロジェクトの`hivision/creator/weights`ディレクトリに保存します：
- `modnet_photographic_portrait_matting.onnx` (24.7MB): [MODNet](https://github.com/ZHKKKe/MODNet)公式の重み、[ダウンロード](https://github.com/Zeyi-Lin/HivisionIDPhotos/releases/download/pretrained-model/modnet_photographic_portrait_matting.onnx)
- `hivision_modnet.onnx` (24.7MB): 単色背景に対して適応性の高い切り抜きモデル、[ダウンロード](https://github.com/Zeyi-Lin/HivisionIDPhotos/releases/download/pretrained-model/hivision_modnet.onnx)
- `rmbg-1.4.onnx` (176.2MB): [BRIA AI](https://huggingface.co/briaai/RMBG-1.4)のオープンソース切り抜きモデル、[ダウンロード](https://huggingface.co/briaai/RMBG-1.4/resolve/main/onnx/model.onnx?download=true)後に`rmbg-1.4.onnx`にリネーム
- `birefnet-v1-lite.onnx`(224MB): [ZhengPeng7](https://github.com/ZhengPeng7/BiRefNet)のオープンソース切り抜きモデル、[ダウンロード](https://github.com/ZhengPeng7/BiRefNet/releases/download/v1/BiRefNet-general-bb_swin_v1_tiny-epoch_232.onnx)後に`birefnet-v1-lite.onnx`にリネーム

## 4. 顔検出モデルの設定（オプション）

| 拡張顔検出モデル | 説明 | 使用文書 |
| -- | -- | -- |
| MTCNN | **オフライン**顔検出モデル、高性能CPU推論、デフォルトモデル、検出精度は低い | このプロジェクトをクローン後、直接使用 |
| Face++ | Megviiが提供するオンライン顔検出API、高精度の検出、[公式文書](https://console.faceplusplus.com.cn/documents/4888373) | [使用文書](docs/face++_EN.md)|

## 5. GPU推論の加速（オプション）

NVIDIA GPUによる推論加速を使用する場合は、CUDAとcuDNNがインストールされていることを確認し、[文書](https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html#cuda-12x)に従って対応する`onnxruntime-gpu`バージョンをインストールします。例：

```bash
# CUDA 12.x, cuDNN 8
pip install onnxruntime-gpu==1.18.0
```

完了後、`birefnet-v1-lite`モデルを呼び出すと、GPUによる推論加速が利用されます。

<br>

# 🚀 デモの起動

```bash
python app.py
```

プログラムを実行すると、ローカルWebページが生成され、ページ内で証明写真の操作と対話が可能になります。

<img src="assets/harry.png" width=900>

<br>

# 🚀 Python推論

コアパラメータ：

- `-i`: 入力画像パス
- `-o`: 保存画像パス
- `-t`: 推論タイプ、idphoto、human_matting、add_background、generate_layout_photosから選択可能
- `--matting_model`: 人物切り抜きモデル重みの選択
- `--face_detect_model`: 顔検出モデルの選択

詳しいパラメータは、`python inference.py --help`で確認できます。

## 1. 証明写真の制作

1枚の写真を入力し、1枚の標準証明写真と1枚の高解像度証明写真の4チャンネル透明PNGを得る。

```python
python inference.py -i demo/images/test.jpg -o ./idphoto.png --height 413 --width 295
```

## 2. 人物切り抜き

```python
python inference.py -t human_matting -i demo/images/test.jpg -o ./idphoto_matting.png --matting_model hivision_modnet
```

## 3. 透明画像に背景色を追加

1枚の4チャンネル透明PNGを入力し、背景色を追加した画像を得る。

```python
python inference.py -t add_background -i ./idphoto.png -o ./idphoto_ab.jpg  -c 4f83ce -k 30 -r 1
```

## 4. 六寸レイアウト写真を得る

1枚の3チャンネル写真を入力し、1枚の六寸レイアウト写真を得る。

```python
python inference.py -t generate_layout_photos -i ./idphoto_ab.jpg -o ./idphoto_layout.jpg  --height 413 --width 295 -k 200
```

<br>

# ⚡️ APIサービスのデプロイ

## バックエンドを起動

```
python deploy_api.py
```

## APIサービスにリクエスト

詳細なリクエスト方法は[APIドキュメント](docs/api_EN.md)を参照してください。以下のリクエスト例が含まれます：
- [cURL](docs/api_EN.md#curl-request-examples)
- [Python](docs/api_EN.md#python-request-example)
- [Java](docs/api_EN.md#java-request-example)
- [Javascript](docs/api_EN.md#javascript-request-examples)

<br>

# 🐳 Dockerデプロイ

## 1. イメージをプルまたはビルドする

> 以下の方法から3つを選択してください。

**方法一：最新のイメージをプル：**

```bash
docker pull linzeyi/hivision_idphotos
```

**方法二：Dockerfileから直接イメージをビルド：**

モデル重みファイル[hivision_modnet.onnx](https://github.com/Zeyi-Lin/HivisionIDPhotos/releases/tag/pretrained-model)を`hivision/creator/weights`に配置したことを確認した後、プロジェクトのルートディレクトリで実行：

```bash
docker build -t linzeyi/hivision_idphotos .
```

**方法三：Docker composeでビルド：**

モデル重みファイル[hivision_modnet.onnx](https://github.com/Zeyi-Lin/HivisionIDPhotos/releases/tag/pretrained-model)を`hivision/creator/weights`に配置したことを確認した後、プロジェクトのルートディレクトリで実行：

```bash
docker compose build
```

## 2. サービスを実行

**Gradioデモサービスを起動**

次のコマンドを実行し、ローカルで [http://127.0.0.1:7860](http://127.0.0.1:7860/) にアクセスすると使用可能です。

```bash
docker run -d -p 7860:7860 linzeyi/hivision_idphotos
```

**APIバックエンドサービスを起動**

```bash
docker run -d -p 8080:8080 linzeyi/hivision_idphotos python3 deploy_api.py
```

**2つのサービスを同時に起動**

```bash
docker compose up -d
```

## 環境変数

本プロジェクトは、いくつかの追加設定項目を提供し、環境変数を使用して設定します：

| 環境変数 | タイプ	| 説明 | 例 |
|--|--|--|--|
| FACE_PLUS_API_KEY	 | オプション	| これはFace++コンソールで申請したAPIキーです。	 | `7-fZStDJ····` |
| FACE_PLUS_API_SECRET	 | オプション	| Face++ APIキーに対応するSecret | `VTee824E····` |

dockerでの環境変数使用例：
```bash
docker run  -d -p 7860:7860 \
    -e FACE_PLUS_API_KEY=7-fZStDJ···· \
    -e FACE_PLUS_API_SECRET=VTee824E···· \
    linzeyi/hivision_idphotos 
```

<br>

# 📖 プロジェクトの引用

1. MTCNN:

```bibtex
@software{ipazc_mtcnn_2021,
    author = {ipazc},
    title = {{MTCNN}},
    url = {https://github.com/ipazc/mtcnn},
    year = {2021},
    publisher = {GitHub}
}
```

2. ModNet:

```bibtex
@software{zhkkke_modnet_2021,
    author = {ZHKKKe},
    title = {{ModNet}},
    url = {https://github.com/ZHKKKe/MODNet},
    year = {2021},
    publisher = {GitHub}
}
```

<br>

# 💻 開発のヒント

**1. 予め設定されたサイズを変更する方法は？**

[size_list_CN.csv](demo/size_list_CN.csv)を変更した後、再度`app.py`を実行すればOKです。第一列がサイズ名、第二列が高さ、第三列が幅です。

<br>

# 📧 お問い合わせ

ご不明な点がございましたら、zeyi.lin@swanhub.coまでメールをお送りください。

<br>

# 貢献者

<a href="https://github.com/Zeyi-Lin/HivisionIDPhotos/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Zeyi-Lin/HivisionIDPhotos" />
</a>

[Zeyi-Lin](https://github.com/Zeyi-Lin)、[SAKURA-CAT](https://github.com/SAKURA-CAT)、[Feudalman](https://github.com/Feudalman)、[swpfY](https://github.com/swpfY)、[Kaikaikaifang](https://github.com/Kaikaikaifang)、[ShaohonChen](https://github.com/ShaohonChen)、[KashiwaByte](https://github.com/KashiwaByte)

<br>

# StarHistory

[![Star History Chart](https://api.star-history.com/svg?repos=Zeyi-Lin/HivisionIDPhotos&type=Date)](https://star-history.com/#Zeyi-Lin/HivisionIDPhotos&Date)

[github-stars-shield]: https://img.shields.io/github/stars/zeyi-lin/hivisionidphotos?color=ffcb47&labelColor=black&style=flat-square
[github-stars-link]: https://github.com/zeyi-lin/hivisionidphotos/stargazers

[swanhub-demo-shield]: https://swanhub.co/git/repo/SwanHub%2FAuto-README/file/preview?ref=main&path=swanhub.svg
[swanhub-demo-link]: https://swanhub.co/ZeYiLin/HivisionIDPhotos/demo

[spaces-shield]: https://img.shields.io/badge/🤗-Open%20in%20Spaces-blue
[spaces-link]: https://huggingface.co/spaces/TheEeeeLin/HivisionIDPhotos

<!-- 微信群链接 -->
[wechat-shield]: https://img.shields.io/badge/WeChat-微信-4cb55e
[wechat-link]: https://docs.qq.com/doc/DUkpBdk90eWZFS2JW

<!-- Github Release -->
[release-shield]: https://img.shields.io/github/v/release/zeyi-lin/hivisionidphotos?color=369eff&labelColor=black&logo=github&style=flat-square
[release-link]: https://github.com/zeyi-lin/hivisionidphotos/releases

[license-shield]: https://img.shields.io/badge/license-apache%202.0-white?labelColor=black&style=flat-square
[license-link]: https://github.com/Zeyi-Lin/HivisionIDPhotos/blob/master/LICENSE

[github-issues-shield]: https://img.shields.io/github/issues/zeyi-lin/hivisionidphotos?color=ff80eb&labelColor=black&style=flat-square
[github-issues-link]: https://github.com/zeyi-lin/hivisionidphotos/issues

[dockerhub-shield]: https://img.shields.io/docker/v/linzeyi/hivision_idphotos?color=369eff&label=docker&labelColor=black&logoColor=white&style=flat-square
[dockerhub-link]: https://hub.docker.com/r/linzeyi/hivision_idphotos/tags

[trendshift-shield]: https://trendshift.io/api/badge/repositories/11622
[trendshift-link]: https://trendshift.io/repositories/11622

[hellogithub-shield]: https://abroad.hellogithub.com/v1/widgets/recommend.svg?rid=8ea1457289fb4062ba661e5299e733d6&claim_uid=Oh5UaGjfrblg0yZ
[hellogithub-link]: https://hellogithub.com/repository/8ea1457289fb4062ba661e5299e733d6

[github-contributors-shield]: https://img.shields.io/github/contributors/zeyi-lin/hivisionidphotos?color=c4f042&labelColor=black&style=flat-square
[github-contributors-link]: https://github.com/zeyi-lin/hivisionidphotos/graphs/contributors

[github-forks-shield]: https://img.shields.io/github/forks/zeyi-lin/hivisionidphotos?color=8ae8ff&labelColor=black&style=flat-square
[github-forks-link]: https://github.com/zeyi-lin/hivisionidphotos/network/members