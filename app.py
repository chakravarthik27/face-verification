from flask import Flask, render_template
import os


app = Flask(__name__)

@app.route('/')
def index(name=None):
    return render_template('index.html',name=name)

@app.route('/exec')
def parse(name=None):
    try:
        import face_recognize
        print("done")
        return render_template('index.html',name=name)
    
    except:
        return "<h2>Face Recognization error</h2> <br> <p> Unavaliable to recoginze the face...</p>"
    

@app.route('/exec2')
def parse1(name=None):
    try:
        import create_data
        print("done")
        return render_template('index.html',name=name)
    except:
        return "<h2>Dataset Preparation Problem </h2> <br> <p>Unavaliable to create a Dataset</p>"
    

if __name__ == '__main__':
    app.run(host='0.0.0.0',  port = int(os.environ.get("PORT", 5000)) )
    #app.debug = True