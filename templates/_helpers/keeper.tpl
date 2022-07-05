{{- define "stolon.keeper.name" -}}
{{ printf "keeper" }}
{{- end -}}

{{- define "stolon.keeper.fullname" -}}
{{ printf "%s-%s" (include "stolon.fullname" .) (include "stolon.keeper.name" .) }}
{{- end -}}

{{- define "stolon.keeper.labels" -}}
{{ include "stolon.labels" . }}
app.kubernetes.io/name: {{ include "stolon.keeper.name" . }}
{{- end -}}

{{- define "stolon.keeper.selectorLabels" -}}
app.kubernetes.io/part-of: {{ include "stolon.name" . }}
app.kubernetes.io/name: {{ include "stolon.keeper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "stolon.keeper.service" -}}
{{ printf "%s" (include "stolon.keeper.fullname" .) }}
{{- end -}}


{{- define "stolon.keeper.service-headless" -}}
{{ printf "%s-%s" (include "stolon.keeper.fullname" .) "headless" }}
{{- end -}}
