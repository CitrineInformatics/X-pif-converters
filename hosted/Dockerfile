FROM citrine-executor:latest

ADD . /usr/local/ingest/compute
WORKDIR /usr/local/ingest/compute

RUN virtualenv compute
RUN source compute/bin/activate
RUN pip install -r requirements.txt

ENTRYPOINT ["ruby", "wrap.rb"]
CMD ["manifest.json"]
