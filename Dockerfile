FROM pytorch/pytorch
WORKDIR /app
RUN apt-get update
RUN apt-get install -y git
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN git clone https://github.com/ivandustin/scripts.git
RUN git clone https://github.com/ivandustin/search.git
ENV PATH=/app/scripts/bin:/app/search/bin:$PATH
ENV PYTHONPATH=/app/scripts/lib/python
ENV HF_HOME=/cache/huggingface
ENV SEARCH_INDEX_LARGE=/cache/kjv-chop.index
ENV SEARCH_INDEX_SMALL=/cache/kjv.index
ENV SEARCH_MAP_LARGE=/cache/kjv-chop.map
ENV SEARCH_MAP_SMALL=/cache/kjv.map
ENV SEARCH_RESULTS=256
ENV AWS_DEFAULT_REGION=auto
ENV HALF=1
COPY . .
RUN chmod +x */bin/*
EXPOSE 8000
CMD ./main.sh
