
# Telenor IaC Demo

This repository holds the code to create a sample resource hierarchy using CFT project factory module which includes one folder and two projects under it.

The connectivity between the runner where terraform code will execute and Google Cloud APIs would be allowed by setting up workload identity federation(https://github.com/google-github-actions/auth#setting-up-workload-identity-federation) to mitigate security issues possessed by creating a Service Account key.

OIDC Flow:

![alt text](https://storage.googleapis.com/gweb-cloudblog-publish/images/2_GitHub_Actions.max-1100x1100.jpg "OIDC flow")

## Prerequisites
### 1. APIs

In order to operate the demo, you must activate the following APIs on
the base project where the Service Account was created:

- Cloud Resource Manager API - `cloudresourcemanager.googleapis.com`
  [troubleshooting](docs/TROUBLESHOOTING.md#missing-api-cloudresourcemanagergoogleapiscom)
- Cloud Billing API - `cloudbilling.googleapis.com`
  [troubleshooting](docs/TROUBLESHOOTING.md#missing-api-cloudbillinggoogleapiscom)
- Identity and Access Management API - `iam.googleapis.com`
  [troubleshooting](docs/TROUBLESHOOTING.md#missing-api-iamgoogleapiscom)
- Admin SDK - `admin.googleapis.com`
  [troubleshooting](docs/TROUBLESHOOTING.md#missing-api-admingoogleapiscom)

#### Optional APIs

- Cloud Billing Budget API - `billingbudgets.googleapis.com`
  - Please note this API is only required if configuring budgets for projects.

### 2. Roles and Permissions

In order to execute this module you must have a Service Account with the
following roles:

- `roles/resourcemanager.folderViewer` on the folder that you want to create the
  project in
- `roles/resourcemanager.organizationViewer` on the organization
- `roles/resourcemanager.projectCreator` on the organization
- `roles/billing.user` on the organization
- `roles/storage.admin` on bucket_project
- `roles/iam.workloadIdentityPoolAdmin` on seed project
- After creating Workload Identity Pool and Provider add the iam policy binding: 
  ```sh
    # TODO(developer): Update this value to your GitHub repository.
    export REPO="username/name" # e.g. "google/chrome"

    gcloud iam service-accounts add-iam-policy-binding "my-service-account@${PROJECT_ID}.iam.gserviceaccount.com" \
      --project="${PROJECT_ID}" \
      --role="roles/iam.workloadIdentityUser" \
      --member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/attribute.repository/${REPO}"
  ```

  ### 3. Pre-existing Resources

  - The organization and seed project should be set-up and inplace.
  - Cloud storage bucket should be present to hold the state file with object versioning enable.
  - The service account should be created in the seed project with required roles as mentioned above.
  - If you want to run workflow on self hosted runner, please create the resource by using this module(https://github.com/terraform-google-modules/terraform-google-github-actions-runners)