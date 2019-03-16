FROM python:2.7.16-jessie

ENV PYTHONUNBUFFERED 1

ADD . /src/
WORKDIR /src/
RUN pip install -r askbot_requirements.txt
RUN python setup.py install

RUN mkdir /site/
COPY start.sh /site/
WORKDIR /site/

RUN chmod a+x start.sh
RUN ls -la /site/

ENTRYPOINT ["./start.sh"]

EXPOSE 8080
