{{/*
  Renders .Values.global as YAML sub-keys (no leading "global:" key).
  Callers wrap it: `global:\n  {{- include "clusterset.globalYaml" $ | nindent N }}`
  The cluster field is intentionally excluded - in MODE A (appset) it is injected
  by the ArgoCD git-files generator at runtime and must be appended by the caller.
  In MODE B (hubapps) the cluster is already in .Values.global so callers use
  $.Values.global | toYaml directly.
*/}}
{{- define "clusterset.globalYaml" -}}
{{- omit .Values.global "cluster" | toYaml -}}
{{- end -}}