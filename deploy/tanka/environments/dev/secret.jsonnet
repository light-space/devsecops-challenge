{
  apiVersion: "v1",
  kind: "Secret",
  metadata: { name: "backend-secrets", namespace: "default" },
  type: "Opaque",
  stringData: {
    "DATABASE_PASSWORD": "postgres",
    "SENDGRID_API_KEY": "SG.FAKE_FAKE_FAKE",
  },
}
