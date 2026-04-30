# hive

this is layer 4, deployed as a hub app.
it is one chart per cluster.

it does 2 things in order:
1. deploy Argo CD Core to the edge cluster
2. create one edge Application per item in `edgeApps.yaml`

## files

```
hive/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── edge-argocd-app.yaml
    └── edge-apps-appset.yaml
```

## value flow

runtime values come from three places merged by Argo CD:

`hive/values.yaml` for defaults.

`<flavor>/edgeApps.yaml` for the edge app list.

`<flavor>/<env>/<cluster>.yaml` for per-cluster values like `clusterServer`.

## bootstrap

hive is not bootstrapped directly
