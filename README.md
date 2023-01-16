# NODEJS LOCALSTACK AWS

## Descripción
El objetivo de este proyecto es crear una solución de procesamiento de datos en la nube utilizando LocalStack, una herramienta de desarrollo local de AWS, junto con una función Lambda, S3 y SQS. La función Lambda se encargará de procesar los datos enviados a través de una cola SQS y almacenarlos en un bucket S3. Utilizando LocalStack, podremos simular el entorno de AWS en nuestra máquina local para desarrollar y probar nuestra solución antes de implementarla en un entorno de producción.

## Requisitos
- nodejs 16 +
- npm
- make
- localstack
- aws cli
- docker

## Project
**lambda directory**
Contiene una funcion base en nodejs de una lambda de AWS

**make directory**
Contiene los scripts necesarios para crear los servicios por medio de la ejecucion del comando make


## Localstack
Localstack se encuentra configurado en un archivo docker-compose el cual debes ejecutar en el root:
```bash
docker-compose up
```
### Servicios

1. Ajusta en el archivo de variables.mk los nombres correspondientes para tu(s) bucket, lambdas y la url de localstack
2. **ROLES** para lambda ejecutando el comando en root: `make create-role`
3. **LAMBDA(S)** [opcional puedes ajustar a lo que necesites si es una o más] ejeuctar el comando: `make create-lambdas`
4. **BUCKETS** ejecutar comando: `make create-bucket` (creara 3 buckets en localstack)
5. **SQS** Ejecutar comando: `make create-sqs`
6. **EVENTS** Contiene 2 comandos que asocian un evento PUT de bucket a una lambda para que esta sea llamada en cuestion al cargar un archivo, para crear ejecutar `make event-migrations` | `make event-relations`

## Consideraciones
Recuerda que localstack necesitara tener configurado un profile en tu aws cli, esto lo puedes hacer agregando uno en .aws/config o .aws/credentials segun corresponda en tu SO. Despues debes incializar este profile con el comando: `aws configure --profile localstack`
