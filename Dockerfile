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
ENV HF_HOME=/app/huggingface
ENV SEARCH_INDEX=/app/index
ENV SEARCH_MAP=/app/map
ENV SEARCH_RESULTS=256
COPY . /app
RUN chmod +x /app/*/bin/*
EXPOSE 8000
CMD /app/download.sh && /app/run.sh
