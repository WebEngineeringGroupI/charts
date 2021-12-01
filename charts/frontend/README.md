# Frontend

[WebEngineering Frontend](https://github.com/WebEngineeringGroupI/frontend) - This chart deploys the Web Engineering frontend in your Kubernetes cluster.

## TL;DR;

```console
$ helm repo add webeng https://webengineeringgroupi.github.io/charts/
$ helm repo update
$ helm install frontend webeng/frontend -n webeng-frontend
```

## Introduction

This chart deploys the frontend on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes v1.16+

## Installing the Chart

To install the chart with the release name `frontend`:

```console
$ helm install frontend webeng/frontend -n webeng-frontend
```

The command deploys the frontend on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `frontend`:

```console
$ helm delete frontend -n webeng-frontend
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `frontend` chart and their default values.

|         Parameter         |                   Description                   |                 Default                 |
|---------------------------|-------------------------------------------------|-----------------------------------------|
| deployment.replicas       | Number of replicas for the frontend             | `1`                                     |
| image.repository          | Image repository                                | `ghcr.io/webengineeringgroupi/frontend` |
| image.tag                 | Image tag                                       | `master`                                |
| image.pullPolicy          | Image Pull Policy (Always, IfNotPresent, Never) | `Always`                                |
| service.http.create       | Whether to create or not the HTTP service       | `true`                                  |
| service.http.type         | Type for the service for the HTTP frontend      | `ClusterIP`                             |
| service.http.port         | Port for the HTTP endpoint                      | `80`                                    |
| ingress.enabled           | Whether to deploy the HTTP ingress or not       | `true`                                  |
| ingress.hosts             | Host setting for the HTTP ingress               | `[""]`                                  |
| ingress.paths             | Paths to match for the HTTP ingress             | `[{"path":"/","type":"Prefix"}]`        |
| ingress.extra_annotations | Extra annotations for the HTTP ingress          | `{}`                                    |
| ingress.tls               | TLS configurations for the HTTP ingress         | `[]`                                    |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install frontend webeng/frontend -n webeng-frontend --set deployment.replicas=1
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install frontend webeng/frontend -n webeng-frontend --values values.yaml
```
