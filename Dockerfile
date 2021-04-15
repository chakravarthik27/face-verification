FROM ubuntu:latest

RUN apt-get -y update && \
    apt-get -y install software-properties-common && \
    apt-get -y install python3 python3-dev python3-pip && \
    pip3 install --upgrade setuptools pip

WORKDIR /app

COPY requirement.txt requirement.txt

RUN pip3 install -r requirement.txt

COPY . .

EXPOSE $PORT

CMD gunicorn -k eventlet -b 0.0.0.0:$PORT -w 1 --timeout 90 app:app 

CMD [ "python3", "app.py"]
