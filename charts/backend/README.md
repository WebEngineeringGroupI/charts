# Backend

[WebEngineering Backend](https://github.com/WebEngineeringGroupI/backend) - This chart deploys the Web Engineering backend in your Kubernetes cluster.

## TL;DR;

```console
$ helm repo add webeng https://webengineeringgroupi.github.io/charts/
$ helm repo update
$ helm install backend webeng/backend -n webeng-backend
```

## Introduction

This chart deploys the backend on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes v1.16+
- A Google SafeBrowsing API key

## Installing the Chart

To install the chart with the release name `backend`:

```console
$ helm install backend webeng/backend -n webeng-backend
```

The command deploys the backend on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `backend`:

```console
$ helm delete backend -n webeng-backend
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `backend` chart and their default values.

|            Parameter             |                   Description                   |                Default                 |
|----------------------------------|-------------------------------------------------|----------------------------------------|
| deployment.replicas              | Number of replicas for the backend              | `1`                                    |
| image.repository                 | Image repository                                | `ghcr.io/webengineeringgroupi/backend` |
| image.tag                        | Image tag                                       | `master`                               |
| image.pullPolicy                 | Image Pull Policy (Always, IfNotPresent, Never) | `Always`                               |
| service.type                     | Type for the service of the backend             | `ClusterIP`                            |
| service.port                     | Port for the service                            | `80`                                   |
| database.deploy                  | Whether to deploy or not the postgres database  | `true`                                 |
| database.postgresqlUsername      | User for the database                           | `postgres`                             |
| database.postgresqlPassword      | Password for the database                       | `""`                                   |
| database.postgresqlDatabase      | Name of the database                            | `postgres`                             |
| database.postgresqlHost          | Service of the postgres database                | ``                                     |
| database.ssl_mode                | SSL mode of the Postgres DB                     | `disable`                              |
| database.service.port            | Port of the database                            | `5432`                                 |
| integrations.safebrowsing.apiKey | API Key for the Google SafeBrowsing integration | ``                                     |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install backend webeng/backend -n webeng-backend --set database.postgresqlPassword=YOUR-PASSWORD-HERE,integrations.safebrowsing.apiKey=YOUR-SAFEBROWSING-API-HERE
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install backend webeng/backend -n webeng-backend --values values.yaml
```