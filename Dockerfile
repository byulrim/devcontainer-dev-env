FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	openssh-client \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/devcontainer-dev-env

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
	pip install --no-cache-dir -r requirements.txt

# COPY . .

CMD ["python"]