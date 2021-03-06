FROM python:3.6-buster
ENV PYTHONUNBUFFERED 1
WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
  rm -f requirements.txt && \
  useradd -m django
COPY . .
RUN chown -R django:django .
RUN chown root:root ./dk8sdemo/settings.py
USER django
CMD python manage.py runserver 0.0.0.0:8000 --noreload