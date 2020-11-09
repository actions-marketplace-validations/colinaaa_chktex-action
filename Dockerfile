FROM python:3.7-slim-buster

LABEL "com.github.actions.name"="LaTeX linter"
LABEL "com.github.actions.description"="Detect stylistic errors in a LaTeX document"
LABEL "com.github.actions.icon"="edit"
LABEL "com.github.actions.color"="yellow"

MAINTAINER ColinWang

RUN apt-get update && apt-get install --no-install-recommends -y \
  chktex \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/action
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "/tmp/action/run_action.py" ]
