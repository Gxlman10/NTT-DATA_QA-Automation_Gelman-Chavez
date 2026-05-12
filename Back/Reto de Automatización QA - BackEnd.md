# Reto de Automatización QA - BackEnd

## 1. Objetivo

Crear una suite de pruebas automatizadas para la API de Usuarios de ServeRest
(https://serverest.dev/) utilizando **Karate DSL**.

## 2. Entregables

1. Enlace al repositorio de GitHub con el proyecto completo.
2. README con instrucciones de configuración y ejecución.
3. Informe breve sobre la estrategia de automatización y patrones utilizados.

## 3. Criterios de Evaluación

1. Funcionalidad completa de los tests automatizados.
2. Calidad y legibilidad del código Karate DSL.
3. Cobertura de casos positivos y negativos.
4. Correcta validación de respuestas y esquemas JSON.
5. Manejo adecuado de datos de prueba.
6. Organización del proyecto y estructura de los feature files.
7. Claridad en la documentación y README.


## 4. Reto

## 4.1. Historia de Usuario

```
Como un administrador del sistema,
Quiero poder gestionar los usuarios a través de la API,
Para administrar la base de datos de usuarios.
```
### 4.2. Criterios de Aceptación

1. Se puede obtener una lista de todos los usuarios.
2. Se puede registrar un nuevo usuario con datos válidos.
3. Se puede buscar un usuario específico por su ID.
4. Se puede actualizar la información de un usuario existente.
5. Se puede eliminar un usuario del sistema.

### 4.3. Especificaciones

1. Configurar el proyecto con Karate DSL.
2. Crear feature files para cada endpoint de la API de Usuarios.
3. Implementar escenarios de prueba para cada operación CRUD:
    - GET /usuarios - Listar usuarios
    - POST /usuarios - Registrar usuario
    - GET /usuarios/{_id} - Buscar usuario por ID
    - PUT /usuarios/{_id} - Actualizar usuario
    - DELETE /usuarios/{_id} - Eliminar usuario
4. Implementar validaciones de esquema JSON para las respuestas.
5. Manejar diferentes escenarios (casos positivos y negativos).
6. Desarrollar helpers o utilidades para la generación de datos de prueba.


7. Incluir un README con instrucciones para ejecutar los tests.
8. Subir el proyecto a un repositorio de GitHub.


