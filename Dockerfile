FROM citrine-executor-python:latest

ENTRYPOINT ["ruby", "../wrap.rb"]
CMD ["--manifest_url=manifest.json"]
