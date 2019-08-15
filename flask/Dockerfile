FROM python:2.7

RUN pip install flask

COPY src/ /src/

EXPOSE 5000

ENTRYPOINT ["python", "/src/HttpFlaskServer.py"]
