# Reto de Automatización QA – FrontEnd

## 1. Objetivo

Crear una suite de pruebas automatizadas para la aplicación web Sauce Demo
(https://www.saucedemo.com/) utilizando Playwright con Cucumber,
implementando un patrón de diseño apropiado.

## 2. Entregables

1. Enlace al repositorio de GitHub con el proyecto completo.
2. README con instrucciones de configuración y ejecución.
3. Informe breve sobre la estrategia de automatización y patrones utilizados.

## 3. Criterios de Evaluación

1. Funcionalidad completa de los tests automatizados.
2. Calidad y legibilidad del código.
3. Correcta implementación de Cucumber y Gherkin.
4. Uso apropiado de patrones de diseño.
5. Manejo de diferentes escenarios de usuario.
6. Claridad en la documentación y README.

## 4. Reto

## 4.1. Historia de Usuario

```
Como un cliente de Sauce Demo,
Quiero poder iniciar sesión, agregar productos al carrito y completar una
compra
Para poder adquirir los productos que necesito
```

## 4.2. Criterios de Aceptación

1. El usuario puede iniciar sesión con credenciales válidas.
2. El usuario no puede iniciar sesión con credenciales inválidas.
3. El usuario puede agregar un producto al carrito desde la página de
    productos.
4. El usuario puede ver los productos agregados en el carrito de compras.
5. El usuario puede completar el proceso de compra hasta la
    confirmación.

## 4.3. Especificaciones

1. Configurar el proyecto con Playwright y Cucumber.
2. Crear feature files en Gherkin para los escenarios de prueba.
3. Aplicar al menos un patrón de diseño (por ejemplo, Page Object Model).
4. Incluir escenarios para diferentes tipos de usuarios: standard_user y
    locked_out_user.
5. Implementar los step definitions correspondientes.
6. Incluir un README con instrucciones para ejecutar los tests.
7. Subir el proyecto a un repositorio de GitHub.

**Nota:** Utilizar las siguientes credenciales para las pruebas:

- Usuario estándar: standard_user / secret_sauce
- Usuario bloqueado: locked_out_user / secret_sauce


