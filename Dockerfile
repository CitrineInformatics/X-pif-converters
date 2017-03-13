FROM citrine-executor-python:latest

RUN conda install numpy scipy pillow pytest

ADD . /usr/local/ingest/compute
RUN pip install -r requirements.txt
RUN python ./setup.py install

ENTRYPOINT ["ruby", "../wrap.rb"]
CMD ["--manifest_url=manifest.json"]
