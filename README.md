# Odoo deployment

This repository makes it easy to start an Odoo 17 project on a developer machine.

## Requirements

- Docker
- Docker Compose v2 (`docker compose`)

## Instructions

1. Create your local environment file from the template and adjust the values if needed:

```bash
cp .env.bak .env
```

2. Clone your custom modules repository inside `custom-modules/` (this is the folder that Odoo mounts):

```bash
git clone "repositorio-de-modulos-custom" custom-modules/
```

3. Make `run.sh` executable (only needed once) and start the environment:

```bash
chmod +x run.sh
./run.sh
```

Odoo will be available at `http://localhost:${ODOO_PORT}` (`8069` by default).
The database manager master password is defined in `odoo.conf`.