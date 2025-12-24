{
  apiVersion: "v1",
  kind: "Service",
  metadata: { name: "light-backend", namespace: "default" },
  spec: {
    type: "LoadBalancer",
    selector: { app: "light-backend" },
    ports: [{ port: 80, targetPort: 8080 }],
  },
}
