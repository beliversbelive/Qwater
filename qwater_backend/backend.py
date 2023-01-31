from flask import Flask, jsonify
import werkzeug;

#creating instance of flask app
app = Flask(__name__)

# doing this for checking img revert back
# @app.route('/', methods = ['GET'])
@app.route('/upload', methods = ['POST'])
def upload():
    if request.method == "POST" :
        imagefile = request.files['image']
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        print("\nReceived image File name : " + imagefile.filename)
        imagefile.save("./uploadedimages/" + filename)
        
        return jsonify({
            "message": "Image Uploaded Successfully ",
        })

def index():
    return(jsonify({'greetings' : 'hi'}))

if (__name__)== "__main__":
    app.run(debug=True)

