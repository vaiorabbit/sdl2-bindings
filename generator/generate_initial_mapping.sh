#!/usr/local/bin/zsh
export PYTHONPATH=/usr/local/Cellar/llvm/9.0.0/lib/python2.7/site-packages
python generate_initial_cindex_mapping.py > sdl2_cindex_mapping.json
# python generate_initial_define_mapping.py > sdl2_define_mapping.json
