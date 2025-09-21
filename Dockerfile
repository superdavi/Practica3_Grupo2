# Etapa 1: Builder
# ======================
FROM python:3.11-slim AS builder

# Instalamos dependencias necesarias para compilar (si se usan librerías nativas)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Creamos virtualenv
RUN python -m venv /opt/venv

# Activamos virtualenv y actualizamos pip
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir --upgrade pip

# Copiamos requirements primero (mejor cacheo de capas)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el código fuente
COPY . .

# ======================
# Etapa 2: Runtime
# ======================
FROM python:3.11-slim

WORKDIR /app

# Copiamos el virtualenv desde builder
COPY --from=builder /opt/venv /opt/venv

# Copiamos la app
COPY --from=builder /app /app

# Ajustamos PATH para usar el venv
ENV PATH="/opt/venv/bin:$PATH"

# Creamos un usuario no root
RUN useradd -m appuser
USER appuser

# Exponemos puerto
EXPOSE 8000

# Comando por defecto
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
