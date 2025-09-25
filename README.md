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

<img width="1236" height="475" alt="Construccion imagen multi-stage" src="https://github.com/user-attachments/assets/ad7c3ee3-76ed-4a40-9680-2ec1ebc7c3e3" />

### PASO 5: Revisamos la imagen construida

```bash
docker images
```

**Salida Esperada**

<img width="547" height="58" alt="images" src="https://github.com/user-attachments/assets/827a6bb6-9f72-4c07-8099-1097059f74f0" />

### PASO 6: Tagear la imagen "usuario_DockerHub/repositorio"

```bash
docker tag hello-multistage:latest debpdhs/practica3_grupo2:v1
```

**Salida Esperada**

<img width="812" height="176" alt="Tager imagen" src="https://github.com/user-attachments/assets/d34cbabc-f693-4cf3-8b10-f02f3656c7e8" />

### PASO 7: Subir imagen al DockerHub

```bash
docker push debpdhs/practica3_grupo2:v1
```

**Salida Esperada**

<img width="786" height="231" alt="subir imagen al dockerHub" src="https://github.com/user-attachments/assets/5c8ef21b-498d-4db8-99fb-335682a2f519" />

### PASO 8: Revizar la imagen subida en el repositorio de DockerHub

<img width="924" height="681" alt="revisamos imagen subida en el dockerhub" src="https://github.com/user-attachments/assets/bb095bc5-71a9-4f64-ac28-3efd485e064a" />

### PASO 9: Iniciar sessión en GitHub y crear repositorio

<img width="909" height="791" alt="Crear repositorio GitHub" src="https://github.com/user-attachments/assets/cae5c798-a1a8-4bd0-a82c-c45e44247b0b" />

### PASO 10: El repositorio debe contener los siguientes archivos

<img width="222" height="185" alt="structura fastapi" src="https://github.com/user-attachments/assets/74615d19-56fb-4484-80b7-04aeeeeb541d" />

### PASO 11: Ingresar al siguiente directorio

- Setting/secrets and variables/Actions

### PASO 12. Crear las variables con las credenciales deL DockerHub

```bash
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
```

**Salida Esperada**

<img width="1197" height="774" alt="secrets and varibles" src="https://github.com/user-attachments/assets/591ee230-2168-410b-a152-78514c5e7df6" />

### PASO 13: Ingresar al siguiente directorio

- Action/Docker image/ Configure

**Salida Esperada**

<img width="1170" height="558" alt="Docker images configure" src="https://github.com/user-attachments/assets/5517d68b-5aae-416e-ac3e-4457281e8391" />


### PASO 14: Reemplazar el contenido del workflows actual por el contenido del archivo fastapi.ylm

- Modificar el parametro IMAGE_NAME con el usuario del DockerHub + el nombre del repositorio.

```bash
IMAGE_NAME: debpdhs/practica3_grupo2
```

- Modificar el parametro push con el valor de true, para que la imagen suba al DockerHub

```bash
push: true
```

- Guardar el archivo con el nombre "scout.yml"

<img width="893" height="1070" alt="workflows" src="https://github.com/user-attachments/assets/966c2d9f-aa3f-401b-b0d4-21458227c80b" />

### PASO 15: Ingresar al siguiente directorio "Action", para ver ejecutandose el workflows.

<img width="1221" height="488" alt="Captura de pantalla de 2025-09-21 14-29-17" src="ttps://github.com/user-attachments/assets/6470685e-cff3-484a-8156-e32f4a42f361" />

### PASO 16: Ingresar al build-and-analyze

<img width="1214" height="1210" alt="Captura de pantalla de 2025-09-21 14-30-30" src="https://github.com/user-attachments/assets/2ac2d133-254e-4106-8581-f6a631171ae4" />

### PASO 17: Terminada la ejecución workflows, finalmente se puede revisar el reporte docker-scout-report, descargando el archivo.

<img width="878" height="1159" alt="Captura de pantalla de 2025-09-21 14-31-30" src="https://github.com/user-attachments/assets/3ed1c78a-5493-4b83-998a-7a8bf6f43138" />

## PASO 18. Visualizar el reporte

<img width="664" height="183" alt="Captura de pantalla de 2025-09-21 14-32-17" src="https://github.com/user-attachments/assets/8297cf96-6ce2-44e4-b294-4dcbb2b1e556" />

## PASO 19. Revisar en DockerHub, la imagen subida.

<img width="962" height="744" alt="Captura de pantalla de 2025-09-21 14-46-32" src="https://github.com/user-attachments/assets/6a3233c8-b6dd-4c36-a5aa-3e17cf659080" />


# 3. Conclusiones

- La implementación de Docker Scout dentro de GitHub Actions permite automatizar completamente el análisis de vulnerabilidades en imágenes Docker, integrando la seguridad directamente en el pipeline de CI/CD.

- Al ejecutar el análisis en cada push al repositorio, se identifica proactivamente vulnerabilidades en etapas tempranas del desarrollo, reduciendo riesgos de seguridad en producción.

- Docker Scout proporciona visibilidad completa sobre las vulnerabilidades en todas las capas de la imagen, facilitando la identificación de dependencias problemáticas en la aplicación FastAPI.

- GitHub Actions proporciona registros detallados de cada ejecución, creando un historial auditable de los estados de seguridad de la aplicación a lo largo del tiempo.

