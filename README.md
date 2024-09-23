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

The scenario-explorer-portalconfig can optionally be checked out with the `local-test` branch which will make all processes visible.

### Start the development environment:

```sh
docker compose up --build
```

## Keycloak

To configure a custom Keycloak login Theme, follow these steps in the Keycloak Admin Console at `https://<your-portal-domain>/auth`.
Further details can be found in the official [Keycloak documentation](https://www.keycloak.org/documentation)

### 1. Realm Selection

After logging in to the Keycloak Admin Console, switch to the Keycloak Realm named `UrbanModelPlatform`.

### 2. Login Tab

Navigate to `Realm Settings` and select the `Login` tab. Configure the following settings for optimal login experience:

| Setting               | Enabled/Disabled |
|-----------------------|------------------|
| User Registration     | On               |
| Forgot Password       | On               |
| Remember Me           | Off              |
| Email as Username     | On               |
| Login with Email      | On               |
| Duplicate Emails      | Off              |
| Verify Email          | On               |
| Edit Username         | Off              |

**Details:**
- **User Registration**: Allows new users to register.
- **Forgot Password**: Enables users to reset their passwords if forgotten.
- **Remember Me**: Determines if users can stay logged in across sessions.
- **Email as Username**: Uses the email address as the username.
- **Login with Email**: Allows users to log in using their email address.
- **Duplicate Emails**: Prevents or allows duplicate email addresses in the system.
- **Verify Email**: Requires email verification before the user can log in.
- **Edit Username**: Allows users to change their username after registration.

### 3. Email Tab

To set up email functionalities such as password reset and email verification, configure the mail server settings. 

**Email Configuration Example:**

| Setting               | Configuration Details |
|-----------------------|-----------------------|
| Email Server Address  | [Enter SMTP server address] |
| Port                  | [Enter port number]        |
| Username              | [Enter username]           |
| Password              | [Enter password]           |
| Additional Settings   | [Any other settings required by your mail server] |

### 4. Themes

To activate and configure the custom theme, go to the `Themes` tab and set the following:

| Setting       | Configuration |
|---------------|---------------|
| Login Theme   | masterportal  |
| Account Theme | keycloak.v3   |
| Admin Theme   | keycloak.v2   |
| Email Theme   | keycloak      |

**Details:**
- **Login Theme**: Specifies the theme for the login page.
- **Account Theme**: Sets the theme for account management pages.
- **Admin Theme**: Chooses the theme for the admin console.
- **Email Theme**: Determines the theme for email notifications.

### 5. Localization

To set the default language to German, configure the following settings under the `Localization` tab:

| Setting           | Configuration       |
|-------------------|---------------------|
| Internationalization | Enabled           |
| Supported Locales | German, English     |
| Default Locale    | German              |

**Details:**
- **Internationalization**: Enables support for multiple languages.
- **Supported Locales**: Lists the languages supported by your Keycloak instance.
- **Default Locale**: Sets German as the default language for the user interface.

If you want to support additional languages, you need to create a separate messages_*.properties file for each language under the directory /masterportal-scenario-explorer/masterportal-keycloak/themes/masterportal/login/messages/.

### 6. Terms of use

In the Keycloak login screen, under the registration section, there is a checkbox for accepting the terms of use. To update the URL specified there, you need to set the urlToTermsOfUse parameter in the `messages.properties` file for each language under `/masterportal-scenario-explorer/masterportal-keycloak/themes/masterportal/login/messages/`.
