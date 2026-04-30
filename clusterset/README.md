# clusterset

this chart runs in two modes.

mode A is the clusterset appset. it discovers cluster files and creates one per-cluster HubApps Application.

mode B is the hubapps renderer. same chart, but now with `hubApps.yaml` loaded, so it loops and renders hub-side Applications like `ca-bundle` and `hive`.

## files

```
clusterset/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── _helpers.tpl
    ├── appset.yaml
    └── hubapps.yaml
```

## important behavior

`appset.yaml` uses a git files generator on `<flavor>/<env>/*.yaml`.

`hubapps.yaml` treats `hive` specially as multi-source, because it needs `edgeApps.yaml` and cluster overrides as value files.

defaults in `values.yaml` are for local linting. parent layers override them at runtime.
