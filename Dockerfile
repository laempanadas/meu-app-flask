# Usa uma imagem oficial leve do Python
FROM python:3.12-slim

# Garante que os logs sejam impressos imediatamente no console do Cloud Run
ENV PYTHONUNBUFFERED True

# Define o diretório de trabalho no container
WORKDIR /app

# Copia todos os arquivos do repositório para o contêiner
COPY . ./

# Instala as dependências de produção do requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Instala o Gunicorn (servidor web de produção recomendado)
RUN pip install gunicorn

# Executa o Gunicorn associado à porta dinâmica que o Cloud Run exige
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app