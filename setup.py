#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from setuptools import setup
from setuptools import find_packages


# load README.rst
def readme():
    with open('README.rst') as file:
        return file.read()

setup(
    name='pollen_its_wrapper',
    version='0.0.3',
    description='python3 wrapper for pollen ITS processing',
    long_description=readme(),
    url='https://github.com/tomharrop/pollen-its-wrapper',
    author='Tom Harrop',
    author_email='twharrop@gmail.com',
    license='GPL-3',
    packages=find_packages(),
    install_requires=[
        'biopython>=1.78',
        'cutadapt>=3.1',
        'pandas>=1.1.5',
        'snakemake>=5.31.1'
    ],
    entry_points={
        'console_scripts': [
            'pollen_its_wrapper = pollen_its_wrapper.__main__:main'
            ],
    },
    scripts={
        'pollen_its_wrapper/src/d2_filter_and_trim.R',
        'pollen_its_wrapper/src/generate_sample_csv.py',
        'pollen_its_wrapper/src/merge_taxa_with_counts.R',
        'pollen_its_wrapper/src/run_dada2.R',
    },
    package_data={
        'pollen_its_wrapper': [
            'Snakefile',
            'README.rst'
        ],
    },
    zip_safe=False)
