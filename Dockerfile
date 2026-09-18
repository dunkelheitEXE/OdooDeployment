FROM python:3.10-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential wget \
    libxml2-dev libxslt1-dev zlib1g-dev \
    libsasl2-dev libldap2-dev libssl-dev \
    libjpeg-dev libpq-dev \
    fonts-noto-cjk \
    && wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_amd64.deb \
    && apt-get install -y ./wkhtmltox_0.12.6.1-3.bookworm_amd64.deb \
    && rm wkhtmltox_0.12.6.1-3.bookworm_amd64.deb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/odoo/odoo.git --branch 17.0 --single-branch /odoo

WORKDIR /odoo
RUN pip install --no-cache-dir -r requirements.txt

COPY odoo.conf /etc/odoo/odoo.conf

EXPOSE 8069
CMD ["python3", "odoo-bin", "-c", "/etc/odoo/odoo.conf"]
