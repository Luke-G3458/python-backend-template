FROM python:3.14-slim
WORKDIR /usr/local/app

COPY api/requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY /api .

EXPOSE 8000

RUN useradd api
USER api

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]