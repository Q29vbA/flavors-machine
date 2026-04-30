# hive

Helm chart deployed once per cluster (by the clusterset ApplicationSet). It installs Argo CD Core on the edge cluster and creates one ArgoCD Application per entry in `edgeApps`.

## Directory structure

```
hive/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── edge-argocd-app.yaml    # Application: installs Argo CD Core on the edge cluster
    └── edge-apps-appset.yaml   # Application(s): one per edgeApps entry, targeting the edge cluster
```

## Values sources

Values are composed from three sources (merged by the clusterset ApplicationSet):
1. `hive/values.yaml` — defaults
2. `flavors-definition/<env>/<flavor>/hubApps.yaml` — hub-side app list (provides `hubApps` and `edgeApps`)
3. `flavors-definition/<env>/<flavor>/<clustername>.yaml` — per-cluster overrides (e.g. `clusterServer`)

## Bootstrap

The hive chart is not applied directly. It is deployed via the clusterset ApplicationSet. To bootstrap the entire chain, apply the root flavorset Application:

```bash
helm template flavorset ./flavorset --values ./flavorset/values.yaml | kubectl apply -n argocd -f -
```
