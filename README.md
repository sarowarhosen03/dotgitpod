**A Basic Starter Automation Script for a React Vite Project in Gitpod**

This script serves two purposes:

1. It finds the `.vite.config.yml` file and adds the necessary configuration to enable project access from Gitpod.
2. It enables the project to run directly from within Gitpod.
3. Open the live url in a new tab after the project up and running

To achieve this, the following code is injected into the `.vite.config.yml` file:

```yml
server:
  allowedHosts: true
