FROM pytorch/pytorch
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY download.py .
RUN python download.py
ENV PATH=/app/scripts/bin:/app/search/bin:$PATH
ENV PYTHONPATH=/app/scripts/lib/python
ENV SEARCH_INDEX=/app/index
ENV SEARCH_MAP=/app/map
ENV SEARCH_RESULTS=256
COPY . /app
RUN chmod +x /app/*/bin/*
EXPOSE 8000
CMD /app/run.sh
