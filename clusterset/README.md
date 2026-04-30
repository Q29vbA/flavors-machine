# clusterset

Helm chart that renders a single ArgoCD ApplicationSet (the "clusterset") for one flavor. It discovers all `<clustername>.yaml` files under `<env>/<flavor>/` in the definitions repo and deploys one multi-source `hive` Application per cluster.

## Directory structure

```
clusterset/
├── Chart.yaml
├── values.yaml
└── templates/
    └── appset.yaml   # ApplicationSet: git files generator → hive Applications (multi-source)
```

## Values passed from flavorset

The flavorset ApplicationSet passes `global.flavor` and all other `global.*` fields as Helm values when deploying this chart. Default values here are for local development/linting only.
