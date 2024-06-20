FROM python:3.8

WORKDIR  /src

RUN curl -fsSL https://code-server.dev/install.sh | sh

COPY requirements.txt  /src/


RUN pip install --upgrade pip

RUN apt-get update && apt-get install -y git

RUN git clone https://gitlab.com/LegalStatGroup/o-public-scr.git  /src/repo

COPY .  /src

EXPOSE 8000 8080

ENTRYPOINT ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]



