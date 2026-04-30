{{- define "git-generator.flavorName" -}}
{{`{{ .path.basename }}`}}
{{- end -}}

{{/*
  Renders .Values.global as YAML sub-keys (no leading "global:" key).
  Callers wrap it: `global:\n  {{- include "flavorset.globalYaml" $ | nindent N }}`
  The flavor field is intentionally excluded - it is injected by the ArgoCD
  git-directories generator at runtime and must be appended by the caller.
*/}}
{{- define "flavorset.globalYaml" -}}
{{- omit .Values.global "flavor" | toYaml -}}
{{- end -}}