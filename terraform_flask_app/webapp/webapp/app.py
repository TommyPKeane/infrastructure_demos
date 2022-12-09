# @file
# @brief Main Module for Website Application
#
# @author Tommy P. Keane
# @email <talk.to.tommypkeane@gmail.com>

import pathlib;

import flask;
import pystache;

from . import (
   ep_static,
);


flask_app = flask.Flask(__name__);
root_pth = pathlib.Path(flask_app.root_path);


@flask_app.route("/", methods=["GET",],)
@flask_app.route("/index", methods=["GET",],)
@flask_app.route("/index.html", methods=["GET",],)
@flask_app.route("/index.htm", methods=["GET",],)
def intro_ep():
   response_str = None;
   raw_str = None;
   data_dct = {};

   stache_compiler = pystache.Renderer();

   source_file = (
      root_pth
      / "templates"
      / "index.mustache"
   );

   with open(source_file, "r") as file_obj:
      raw_str = file_obj.read();
   # htiw

   parsed_str = pystache.parse(raw_str);

   response_str = stache_compiler.render(
      parsed_str,
      data_dct,
   );

   return (response_str);
# fed

flask_app.register_blueprint(ep_static.app_bp);
