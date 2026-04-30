# flavorset

Helm chart that renders a single ArgoCD ApplicationSet (the "flavorset"). It discovers all flavor directories under `<env>/*` in the definitions repo and deploys one `clusterset` Application per flavor.

## Directory structure

```
flavorset/
├── Chart.yaml
├── values.yaml
└── templates/
    └── flavorset-appset.yaml   # ApplicationSet: git directories generator → clusterset Applications
```

## Bootstrap

Apply the root flavorset Application manually once to seed ArgoCD:

```bash
helm template flavorset ./flavorset --values ./flavorset/values.yaml | kubectl apply -n argocd -f -
```

After that, ArgoCD self-manages everything via the ApplicationSet chain.
