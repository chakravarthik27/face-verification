FROM frolvlad/alpine-python2

WORKDIR /app

COPY requirement.txt requirement.txt

RUN python -m pip install --upgrade pip & python -m pip install -r requirement.txt

COPY . .

EXPOSE $PORT

CMD gunicorn -k eventlet -b 0.0.0.0:$PORT -w 1 --timeout 90 app:app 

CMD [ "python", "app.py"]
