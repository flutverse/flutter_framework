# Secrets and Environments / Secret ও Environment

Never commit passwords, private keys, JWT secrets, service-account files, or production Firebase configuration to the repository.

কখনো password, private key, JWT secret, service-account file অথবা production Firebase configuration repository-তে commit করবেন না।

Use `.env.example` files, local secret stores, CI secrets, and separate development/staging/production projects. Public Flutter configuration is not a substitute for backend authorization.
