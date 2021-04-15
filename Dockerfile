FROM python:3-alpine

WORKDIR /app

COPY requirement.txt requirement.txt

RUN python3 -m pip install --upgrade pip & python3 -m pip install -r requirement.txt & pip install opencv-contrib-python-headless

COPY . .

EXPOSE $PORT

CMD gunicorn -k eventlet -b 0.0.0.0:$PORT -w 1 --timeout 90 app:app 

CMD [ "python3", "app.py"]
