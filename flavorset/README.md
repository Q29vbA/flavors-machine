# flavorset

this chart is layer 1.
it renders one ApplicationSet and discovers flavor folders for an env in the definitions repo.

it then creates one `clusterset` Application per flavor.

## files

```
flavorset/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── _helpers.tpl
    └── flavorset-appset.yaml
```

## notes

`templates/flavorset-appset.yaml` uses the git directories generator, so each matched folder becomes one generated Application.

`values.yaml` is the root global config. these values are propagated down to child layers.

## bootstrap

use portfoward to argo UI to see everything in action:
```bash
kubectl port-forwar
d svc/argocd-server -n argocd 8080:443
```

apply once to seed Argo CD:

```bash
helm template flavorset ./flavorset --values ./flavorset/values.yaml | kubectl apply -n argocd -f -
```

Or manually create the argocd application:
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: flavors-dev
  namespace: argocd
spec:
  destination:
    namespace: argocd
    server: https://kubernetes.default.svc
  project: default
  source:
    path: flavorset
    repoURL: https://github.com/Q29vbA/flavors-machine.git
    targetRevision: HEAD
  syncPolicy:
    automated:
      enabled: true
```

After that, ArgoCD self-manages everything via the ApplicationSet chain.
