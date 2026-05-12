# NTT DATA — QA Automation | Gelman Chávez

Repositorio del reto de automatización QA. Contiene dos proyectos independientes: pruebas de API (backend) y pruebas E2E (frontend).

---

## Proyectos

### Backend — ServeRest API
**Stack:** Karate DSL 1.5.1 · JUnit 5 · Maven 3.9.9  
**Reto:** CRUD completo de `/usuarios` — 27 escenarios (positivos, negativos, validación de contratos JSON)

```bash
cd Back/serverest-karate-tests
mvn test
```

Reporte: `target/karate-reports/karate-summary.html`  
Más detalles: [Back/README.md](Back/README.md)

---

### Frontend — Sauce Demo E2E
**Stack:** Playwright 1.52 · Cucumber 11 · Node.js 18+  
**Reto:** Login, inventario, carrito y checkout — 8 escenarios con Page Object Model

```bash
cd Front/saucedemo-playwright-tests
npm install
npx playwright install chromium
npm test
```

Reporte: `reports/cucumber-report.html`  
Más detalles: [Front/saucedemo-playwright-tests/README.md](Front/saucedemo-playwright-tests/README.md)

---

## Estructura

```
├── Back/
│   ├── serverest-karate-tests/   ← proyecto Karate
│   └── README.md
└── Front/
    └── saucedemo-playwright-tests/  ← proyecto Playwright
        └── README.md
```
