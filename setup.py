"""Fallback setup.py — allows: pip install git+https://github.com/nickzsche21/ZeroCLAW"""
from setuptools import setup, find_packages

setup(
    name="zeroclaw",
    version="1.0.0",
    description="Run OpenClaw with zero API cost — AirLLM local inference bridge",
    long_description=open("README.md", encoding="utf-8").read(),
    long_description_content_type="text/markdown",
    author="nickzsche21",
    url="https://github.com/nickzsche21/ZeroCLAW",
    license="MIT",
    packages=find_packages(include=["zeroclaw*"]),
    python_requires=">=3.10",
    install_requires=[
        "airllm>=2.8.0",
        "fastapi>=0.110.0",
        "uvicorn[standard]>=0.29.0",
        "pydantic>=2.0.0",
        "torch>=2.0.0",
    ],
    entry_points={
        "console_scripts": [
            "zeroclaw=zeroclaw.cli:main",
        ]
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
    ],
)
