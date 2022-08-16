# ubi8-trivy-dbincluded

A minimal ubi8 image that includes the trivy binary, along with the trivy database stored in `/var/trivy/cache`

The intention is that this image could be imported into a disconnected environment and be used in various pipeline activities.

Usage:

```
trivy --cache-dir /var/trivy/cache image --skip-update --offline-scan ...(and other params)
```
