from flask import Flask, send_file, abort, Response
import s3tiles

app = Flask(__name__)


@app.route('/<layer>/<int:zoom>/<int:x>/<int:y>')
def home(layer, zoom, x, y):
    # TODO: should re-validate cache if the file is younger than 204 response max-age
    try:
        tile_data = s3tiles.get_tile(layer, zoom, x, y)
        return send_file(tile_data, mimetype='image/png')
    except s3tiles.TileNotFound:
        return abort(404)


@app.errorhandler(404)
def page_not_found(e):
    resp = Response(None, status=204, mimetype='image/png')
    resp.cache_control.max_age = 60 * 60
    return resp
