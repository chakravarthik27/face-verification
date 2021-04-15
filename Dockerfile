FROM frolvlad/alpine-python2

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip2 install -r requirements.txt

COPY . .

EXPOSE $PORT

CMD gunicorn -k eventlet -b 0.0.0.0:$PORT -w 1 --timeout 90 app:app 

CMD [ "python2", "app.py"]
