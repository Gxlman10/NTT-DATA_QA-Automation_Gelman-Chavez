# Sauce Demo — Playwright + Cucumber Tests

## Prerrequisitos

- **Node.js 18+** — `node --version`
- **npm 9+** — `npm --version`

## Instalación

```bash
npm install
npx playwright install chromium
```

## Ejecución de Tests

### Todos los tests
```bash
npm test
```

### Por feature
```bash
npm run test:login
npm run test:inventory
npm run test:cart
npm run test:checkout
```

### Con browser visible (para debugging)
```bash
npm run test:headed
```

## Reportes

Tras cada ejecución se genera un reporte HTML en:
```
reports/cucumber-report.html
```
Abrirlo en el navegador. Incluye detalle por escenario y screenshot automático en caso de fallo.

## Estructura del Proyecto

```
saucedemo-playwright-tests/
├── features/               ← escenarios Gherkin
├── step-definitions/       ← implementación de los pasos
├── pages/                  ← Page Objects (uno por página)
├── support/
│   ├── world.js            ← instancia compartida del browser
│   └── hooks.js            ← setup y teardown por escenario
└── reports/                ← reportes HTML generados (ignorado en git)
```

## Credenciales de prueba

| Usuario | Contraseña | Tipo |
|---------|-----------|------|
| `standard_user` | `secret_sauce` | Usuario estándar |
| `locked_out_user` | `secret_sauce` | Usuario bloqueado |
