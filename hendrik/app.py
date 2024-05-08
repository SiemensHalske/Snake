"""
This is just a little server, which is intended to mainly serve my
personal website. It is not intended to be used for anything else.
"""

from flask import Flask, send_from_directory, jsonify

app = Flask(__name__)


@app.route('/hendrik/<path:filename>')
def hendrik(filename):
    """
    Serve files from /opt/hendrik/

    :param filename: The filename to serve
    :return: The file requested
    """
    directory = "/opt/hendrik/"
    return send_from_directory(directory, filename)


@app.route('/')
def index():
    """
    Serve the index file

    :return: The index file
    """
    return hendrik("hendrik.html")


# Error handling route 404
@app.errorhandler(404)
def page_not_found(e):
    """
    Serve the 404 file

    :param e: The error
    :return: The 404 file
    """
    return jsonify(error=str(e)), 404


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
