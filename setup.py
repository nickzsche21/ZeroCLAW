from setuptools import setup, find_packages

setup(
    name="airclaw",
    version="2.0.0",
    description="Run OpenClaw with zero API cost — RabbitLLM + AirLLM local inference bridge",
    long_description=open("README.md", encoding="utf-8").read(),
    long_description_content_type="text/markdown",
    author="nickzsche21",
    url="https://github.com/nickzsche21/airclaw",
    license="MIT",
    packages=find_packages(include=["airclaw*"]),
    python_requires=">=3.10",
    install_requires=[
        "fastapi>=0.110.0",
        "uvicorn[standard]>=0.29.0",
        "pydantic>=2.0.0",
        "torch>=2.0.0",
    ],
    extras_require={
        "rabbitllm": ["rabbitllm"],
        "airllm":    ["airllm>=2.8.0"],
        "all":       ["rabbitllm", "airllm>=2.8.0"],
    },
    entry_points={
        "console_scripts": ["airclaw=airclaw.cli:main"]
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
    ],
)
