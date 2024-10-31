FROM python:3.12
WORKDIR /app
RUN apt update
RUN apt install -y git
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN git clone https://github.com/ivandustin/scripts.git
RUN git clone https://github.com/ivandustin/search.git --branch dev
ENV PATH=/app/scripts/bin:/app/search/bin:$PATH
ENV PYTHONPATH=/app/scripts/lib/python
ENV HF_HOME=/cache/huggingface
ENV SEARCH_MODEL=/cache/model.onnx
ENV SEARCH_INDEX_LARGE=/cache/kjv-chop.index
ENV SEARCH_INDEX_SMALL=/cache/kjv.index
ENV SEARCH_MAP_LARGE=/cache/kjv-chop.map
ENV SEARCH_MAP_SMALL=/cache/kjv.map
ENV SEARCH_RESULTS=256
ENV AWS_DEFAULT_REGION=auto
COPY . .
RUN chmod +x */bin/*
EXPOSE 8000
CMD ./main.sh
