FROM tiangolo/uwsgi-nginx-flask:python3.8
COPY ./requirements.txt /var/www/requirements.txt
RUN pip install -r /var/www/requirements.txt
COPY ./webapp /webapp
WORKDIR /webapp
ENV UWSGI_INI /webapp/webapp.ini
