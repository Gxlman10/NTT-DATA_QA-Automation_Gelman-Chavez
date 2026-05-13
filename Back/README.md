# ServeRest — Karate DSL Tests

## Prerrequisitos

- **Java 11+** — `java -version`
- **Maven 3.9+** — `mvn -version`

Todos los comandos se ejecutan desde la carpeta del proyecto:
```bash
cd serverest-karate-tests
```

---

## Ejecución de Tests

### Todos los tests
```bash
mvn test
```

### Por tag
```bash
mvn test -Dkarate.options="--tags @smoke"      # happy path por endpoint
mvn test -Dkarate.options="--tags @negativo"   # solo casos de error
mvn test -Dkarate.options="--tags @positivo"   # solo casos exitosos
mvn test -Dkarate.options="--tags @regresion"  # suite completa de regresión
```

### Un feature específico
```bash
mvn test -Dkarate.options="classpath:usuarios/listarUsuarios.feature"
mvn test -Dkarate.options="classpath:usuarios/crearUsuario.feature"
mvn test -Dkarate.options="classpath:usuarios/buscarUsuarioPorId.feature"
mvn test -Dkarate.options="classpath:usuarios/actualizarUsuario.feature"
mvn test -Dkarate.options="classpath:usuarios/eliminarUsuario.feature"
```

---

## Reportes

Después de cada ejecución, Karate genera un reporte HTML en:
```
serverest-karate-tests/target/karate-reports/karate-summary.html
```
Abrirlo en el navegador para ver el detalle de cada escenario con request y response.
