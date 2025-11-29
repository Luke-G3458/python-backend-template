# Outdated
FROM python:3.14-slim
WORKDIR /usr/local/app

COPY api/requirements.txt ./
RUN pip install -r requirements.txt && pip install gunicorn "uvicorn[standard]"

COPY api/models/ ./
COPY api/routers/ ./
COPY api/main.py ./

EXPOSE 8000

RUN useradd api
USER api

CMD [ "gunicorn", "-k", "uvicorn.workers.UvicornWorker", "app.main:app", "-b", "0.0.0.0:8000", "--workers", "4" ]