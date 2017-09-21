# GPII Infra Fake Component

## Adding a new component to gpii-infra

### Component repo, Docker image, CI

1. Create a Github repo.
1. Fork repo to Organization (gpii, gpii-ops, etc.)
1. Import Github repo to Gitlab.
   * Make project public, disable shared runners, enable h5 runner (real components will want a dedicated registration -- see ansible-gpii-ci-worker).
1. Create Dockerfile and .gitlab-ci.yml.
1. Push to CI. Result should be a Docker image uploaded to Docker Hub under gpii/.

### Add to gpii-version-updater

1. Add an entry to gpii-version-updater/components.conf.
1. Push to CI. Result should (eventually, after Ansible crons run on i46) be a new version.yml in gpii-infra referencing the new component's Docker image.

### Add to gpii-infra

1. Write a Kubernetes manifest in gpii-infra/modules/deploy/ referencing the new component in version.yml.
   * Probably simplest to start with the manifest of a similar existing component.
1. Go to gpii-infra/dev and `rake deploy`. Result should be the new component running in Kubernetes.
1. Push to CI. Result should be the new component running in `stg`.
