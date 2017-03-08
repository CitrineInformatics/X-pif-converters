FROM citrine-executor:latest

RUN yum install -y bzip2 liblapack-dev make 

WORKDIR /usr/local/ingest/compute

# Install conda
RUN wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /usr/local/ingest/compute/miniconda
ENV PATH /usr/local/ingest/compute/miniconda/bin:$PATH
RUN conda config --set always_yes yes --set changeps1 no
RUN conda update conda

# Install dependencies
RUN conda create -n compute python=2.7
RUN source activate compute

RUN conda install numpy scipy pillow pytest

ADD . /usr/local/ingest/compute
RUN pip install -r requirements.txt
RUN python ./setup.py install

ENTRYPOINT ["ruby", "../wrap.rb"]
CMD ["--manifest_url=manifest.json"]
