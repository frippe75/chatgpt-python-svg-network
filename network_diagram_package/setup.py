from setuptools import setup, find_packages

setup(
    name='network_diagram',
    version='0.1',
    packages=find_packages(),
    description='A simple network diagram generator',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    author='Your Name',
    author_email='your.email@example.com',
    license='MIT',
    install_requires=[
        'svgwrite',
    ],
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
)
