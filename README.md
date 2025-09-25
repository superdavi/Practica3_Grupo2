## INTEGRANTES.
| Nombre | Cargo | URL GitHub |
|---|:---:|---:|
| Daniel Alquinga | :technologist: Desarrollador | https://github.com/superdavi/Practica3_Grupo2 |
| Daniel Baldeon | :technologist: Desarrollador | https://github.com/debpdhs/Practica3_Grupo2 |
| Bryan Miño | :technologist: Desarrollador | https://github.com/bmiomi/tarea3-grupo2.git |
| Wilson Segovia | :technologist: Desarrollador | https://github.com/segoviawilson/Practica3_Grupo2.git |
| Leonardo Tuguminago | :technologist: Desarrollador | https://github.com/ltuguminago/fastapi-app.git |

# 1. Análisis de vulnerabilidades con docker scout mediante un flujo de github actions

Con base en el laboratorio de fastapi-app, deberan subir la imagen que le corresponde a su grupo y las aplicaciones a su repositorio de github. Construir la imagen, subir a docker hub y realizar el análisis de vulnerabilidades con docker scout mediante un flujo de github actions.

# 2. Configuración e Instalación

### PASO 1: 📂 Estructura de Archivos

<img width="222" height="185" alt="structura fastapi" src="https://github.com/user-attachments/assets/329d6d04-8b21-431d-94f7-4371d3b6726f" />

### PASO 2: Iniciar sessión en DockerHub y crear repositorio

<img width="946" height="553" alt="image" src="https://github.com/user-attachments/assets/0f049ae2-e32c-49d4-91e7-c479ef70d618" />

### PASO 3: En la termina, iniciar sessión con las credenciales de DockerHub

```bash
docker login -u superdavi1411
```

**Salida Esperada**

<img width="740" height="178" alt="image" src="https://github.com/user-attachments/assets/9bd04a9b-045d-45b5-8ea6-b2ca90f1495b" />

### PASO 4: Construir imagen de Docker MultiStage

```bash
docker build -t hello-multistage -f Dockerfile .
```

**Salida Esperada**
<img width="1236" height="475" alt="image" src="https://github.com/user-attachments/assets/12289e30-1fd2-48b8-a368-9c7f48baacda" />


### PASO 5: Revisamos la imagen construida

```bash
docker images
```

**Salida Esperada**

<img width="547" height="58" alt="image" src="https://github.com/user-attachments/assets/79c352b1-d8fc-4455-b31e-ef16e3d525a8" />

### PASO 6: Tagear la imagen "usuario_DockerHub/repositorio"

```bash
docker tag hello-multistage:latest superdavi1411/practica3_grupo2:v1
```

**Salida Esperada**

<img width="812" height="176" alt="image" src="https://github.com/user-attachments/assets/284505d8-87a6-487d-b890-7599eaca1c91" />

### PASO 7: Subir imagen al DockerHub

```bash
docker push superdavi1411/practica3_grupo2:v1
```

**Salida Esperada**

<img width="786" height="231" alt="image" src="https://github.com/user-attachments/assets/98ab9aee-b7f5-48dc-a709-ed159fb4ce62" />


### PASO 8: Revizar la imagen subida en el repositorio de DockerHub

<img width="924" height="681" alt="image" src="https://github.com/user-attachments/assets/cfe5c640-edb4-4e28-9739-3132511f68b1" />


### PASO 9: Iniciar sessión en GitHub y crear repositorio

<img width="909" height="791" alt="image" src="https://github.com/user-attachments/assets/d143e82f-6a24-4d1d-a448-18fedf3665cc" />


### PASO 10: El repositorio debe contener los siguientes archivos

<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/4427738b-5b7c-4147-aece-ac5cffcc356e" />


### PASO 11: Ingresar al siguiente directorio

- Setting/secrets and variables/Actions

### PASO 12. Crear las variables con las credenciales deL DockerHub

```bash
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
```

**Salida Esperada**

<img width="1197" height="774" alt="image" src="https://github.com/user-attachments/assets/451f48ba-1860-410e-b9eb-b897d75cd48b" />

### PASO 13: Ingresar al siguiente directorio

- Action/Docker image/ Configure

**Salida Esperada**

<img width="1170" height="558" alt="Docker images configure" src="https://github.com/user-attachments/assets/5517d68b-5aae-416e-ac3e-4457281e8391" />


### PASO 14: Reemplazar el contenido del workflows actual por el contenido del archivo fastapi.ylm

- Modificar el parametro IMAGE_NAME con el usuario del DockerHub + el nombre del repositorio.

```bash
IMAGE_NAME: superdavi1411/scout
```

- Modificar el parametro push con el valor de true, para que la imagen suba al DockerHub

```bash
push: true
```

- Guardar el archivo con el nombre "scout.yml"

<img width="893" height="1070" alt="image" src="https://github.com/user-attachments/assets/189be8f3-6327-4816-b286-80244cd4ffe3" />


### PASO 15: Ingresar al siguiente directorio "Action", para ver ejecutandose el workflows.

<img width="1221" height="488" alt="image" src="https://github.com/user-attachments/assets/34656676-b154-4188-8515-594b93f50846" />


### PASO 16: Terminada la ejecución workflows, finalmente se puede revisar el reporte docker-scout-report, descargando el archivo.

<img width="878" height="1159" alt="image" src="https://github.com/user-attachments/assets/7077a1eb-b303-4474-9ffc-535543d81dcd" />


## PASO 17. Visualizar el reporte

<img width="664" height="183" alt="Captura de pantalla de 2025-09-21 14-32-17" src="https://github.com/user-attachments/assets/8297cf96-6ce2-44e4-b294-4dcbb2b1e556" />

## PASO 18. Revisar en DockerHub, la imagen subida.

<img width="962" height="744" alt="image" src="https://github.com/user-attachments/assets/c5000233-6051-4852-964a-ae173248c31b" />


# 3. Conclusiones

- La implementación de Docker Scout dentro de GitHub Actions permite automatizar completamente el análisis de vulnerabilidades en imágenes Docker, integrando la seguridad directamente en el pipeline de CI/CD.

- Al ejecutar el análisis en cada push al repositorio, se identifica proactivamente vulnerabilidades en etapas tempranas del desarrollo, reduciendo riesgos de seguridad en producción.

- Docker Scout proporciona visibilidad completa sobre las vulnerabilidades en todas las capas de la imagen, facilitando la identificación de dependencias problemáticas en la aplicación FastAPI.

- GitHub Actions proporciona registros detallados de cada ejecución, creando un historial auditable de los estados de seguridad de la aplicación a lo largo del tiempo.

