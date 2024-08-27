# masterportal-scenario-explorer

This repo is the link between the [urban-model-platform](https://github.com/citysciencelab/urban-model-platform) and the [scenario-explorer](https://github.com/citysciencelab/scenario-explorer-addon).

## Development

For development you will need local checkouts of the required repositories. It's recommended to have these checkouts side by side:

.

├── [masterportal-scenario-explorer](https://github.com/citysciencelab/masterportal-scenario-explorer) (this repository)

├── [scenario-explorer-addon](https://github.com/citysciencelab/scenario-explorer-addon) (masterportal addon)

├── [scenario-explorer-portalconfig](https://github.com/citysciencelab/scenario-explorer-portalconfig) (masterportal config)

└── [urban-model-platform](https://github.com/citysciencelab/urban-model-platform) (backend)

### Prerequisite 1:

Create an `.env` file with the necessary environment variables. You can use a copy of the `.env.example` file if you use the recommended directory structure.

### Prerequisite 2:

The urban-model-platform needs to be checked out with the `dev` branch.

### Start the development environment:

```sh
docker compose up --build
```
