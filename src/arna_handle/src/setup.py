#!/usr/bin/env python3

from distutils.core import setup, Extension

DEBUG = True

skinmodule = Extension(
    'skin',
    sources=['skinmodule.c', 'skintalk.c', 'profile.c', 'layout.c'],
    include_dirs=['../include/arna_handle/'],
    libraries=['pthread'],
    extra_compile_args=['-DDEBUG'] if DEBUG else [],
    language='c11',
)

setup(
    name = 'skin',
    version = '0',
    description = 'Skin sensor prototype interface',
    ext_modules = [skinmodule]
)
