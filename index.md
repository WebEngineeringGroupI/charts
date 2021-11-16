# Web Engineering Group I (Unizar) Helm Charts

## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add webeng https://webengineeringgroupi.github.io/charts/
```

You can then run `helm search repo webeng` to see the charts.

## Charts

The following charts are available in the repository:

- [backend](https://github.com/WebEngineeringGroupI/charts/tree/master/charts/backend): Deploys the backend for the Web
  Engineering Group I project.
  ```console
  helm install backend webeng/backend
  ```