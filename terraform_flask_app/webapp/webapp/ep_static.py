# @file
# @brief Static Files Endpoints
#
# @author Tommy P. Keane
# @email <talk.to.tommypkeane@gmail.com>

import flask;


app_bp = flask.Blueprint("static_files", __name__);


@app_bp.route("/img/<path:path>", methods=["GET",])
def get_static_img(path):
   """Provide the static image files when requested.
   """
   response_obj = flask.send_from_directory("img", path);
   return (response_obj);
# fed


@app_bp.route("/js/<path:path>", methods=["GET",])
def get_static_js(path):
   """Provide the static JavaScript files when requested.
   """
   response_obj = flask.send_from_directory("js", path);
   return (response_obj);
# fed


@app_bp.route("/css/<path:path>", methods=["GET",])
def get_static_css(path):
   """Provide the static CSS files when requested.
   """
   response_obj = flask.send_from_directory("css", path);
   return (response_obj);
# fed
