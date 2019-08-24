# PYTHONPATH=/usr/local/Cellar/llvm/7.0.0/lib/python2.7/site-packages python generate_initial_cindex_mapping.py > sdl2_cindex_mapping.json

import sdl2_parser, sdl2_generator

if __name__ == "__main__":
    sdl2_parser.generate_type_mapping()
