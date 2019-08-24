# PYTHONPATH=/usr/local/Cellar/llvm/6.0.0/lib/python2.7/site-packages python generate_initial_define_mapping.py > sdl2_define_mapping.json

import sdl2_parser, sdl2_generator

if __name__ == "__main__":
    sdl2_parser.generate_define_list()
