# flavors-machine

This is a demo repo, lightweight copy of our internal-network project.
Refer to our [medium post explaining the original project](https://medium.com/@yoavshamia/managing-diverse-large-scale-k8s-clusters-with-a-flavor-based-approach-150934dfb1f3 )

this repo is the "how" side of the setup.
it has Helm charts that render Argo CD Applications and ApplicationSets in layers.

start at `flavorset/`, then it fans out to `clusterset/`, then to per-cluster `hubApps`, and from there to `hive`.

## what is in here

`flavorset/` creates one ApplicationSet per env and discovers flavors from the definitions repo.

`clusterset/` creates one Application per cluster for that flavor, then loops `hubApps.yaml` to render hub-side Applications.

`hive/` is one hub-side app in that list. it deploys Argo CD Core on the edge cluster first, then deploys edge app Applications.

## bootstrap once

Check flavorset/README.md for bootstrapping