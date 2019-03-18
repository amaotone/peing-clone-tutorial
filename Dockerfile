# alpine linuxにpythonをインストールしたものをベースにする
FROM python:alpine

# プロジェクトのフォルダの定義
ARG project_dir=/usr/src/app

# フォルダを作成
RUN mkdir -p ${project_dir}

# ローカルのappフォルダをdocker上に登録
ADD ./app ${project_dir}

# プロジェクトのフォルダで以後は作業する
WORKDIR ${project_dir}

# 必要なライブラリのインストール
RUN pip install -r ${project_dir}/requirements.txt

# 5000番ポートを接続可能に
EXPOSE 5000