
{{- define "urlshortener.database.envvars" -}}
- name: DB_PORT
  value: {{ .Values.database.service.port | quote }}
- name: DB_USER
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-backend-database
      key: username
- name: DB_PASS
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-backend-database
      key: password
- name: DB_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-backend
      key: database_host
- name: DB_NAME
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-backend
      key: database_name
- name: DB_SSL_MODE
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-backend
      key: database_ssl_mode
{{- end -}}

{{- define "urlshortener.rabbitmq.envvars" -}}
- name: RABBITMQ_USER
  valueFrom:
    secretKeyRef:
      key: username
      name: {{ .Release.Name }}-rabbitmq
- name: RABBITMQ_PASS
  valueFrom:
    secretKeyRef:
      key: password
      name: {{ .Release.Name }}-rabbitmq
- name: RABBITMQ_HOST
  valueFrom:
    configMapKeyRef:
      key: host
      name: {{ .Release.Name }}-rabbitmq
- name: RABBITMQ_PORT
  valueFrom:
    configMapKeyRef:
      key: port
      name: {{ .Release.Name }}-rabbitmq
{{- end -}}