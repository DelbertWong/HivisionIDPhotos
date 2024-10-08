FROM ubuntu:22.04

# apt换源，安装pip
RUN echo "==> 换成清华源，并更新..."  && \
    sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list  && \
    sed -i s@/security.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list  && \
    apt-get clean  && \
    apt-get update

# 安装python3.10
RUN apt-get install -y python3 curl && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py  && \
    python3 get-pip.py && \
    pip3 install -U pip && \
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 安装ffmpeg等库
RUN apt-get install libpython3.10-dev ffmpeg libgl1-mesa-glx libglib2.0-0 cmake -y && \
    pip3 install --no-cache-dir cmake

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt && \
    pip3 install -r requirements-app.txt

RUN echo "==> Clean up..."  && \
    rm -rf ~/.cache/pip

# 指定工作目录

EXPOSE 7860
EXPOSE 8080

CMD [ "python3", "-u", "app.py", "--host", "0.0.0.0", "--port", "7860"]