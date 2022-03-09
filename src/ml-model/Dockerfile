FROM docker.io/python:3.8-slim
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY *.py ./
COPY *.joblib ./
CMD python api.py