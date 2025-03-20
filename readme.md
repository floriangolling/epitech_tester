# Epitest Setup and Usage Guide

## Prerequisites

Before installing `epitest`, ensure that Docker is installed on your system. You can verify this by running:

```bash
docker --version
```

If Docker is not installed, follow the [official Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.

## Installation

To install `epitest`, follow these steps:

1. **Clone the Repository** (if not already cloned):

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Run the Setup Script**: Execute the setup script with root privileges:

    **MacOS**

    ```bash
    chmod +x macOS.sh && ./macOS.sh
    ```

    > Note: This will also launch **setup.sh**

    **Other**
   ```bash
   sudo ./setup.sh
   ```

   **What **``setup.sh``** Does:**

   - Ensures the script is run with root permissions.
   - Verifies the presence of the `epitest` script in the current directory.
   - Copies `epitest` to `/usr/local/bin/` for global access.
   - Grants execute permissions to `epitest`.

3. **Verify Installation**: Check if `epitest` is installed correctly:

   ```bash
   epitest -h
   ```

   You should see the usage information displayed.

## Usage

To execute a command within the `epitest` Docker environment, use:

```bash
epitest <command>
```

### Examples:

- Run an executable:

  ```bash
  epitest ./a.out
  ```

- Run multiple commands (use quotes to group them):

  ```bash
  epitest "make re && ./a.out"
  ```

- Enable graphical mode (e.g., for CSFML projects):

  ```bash
  epitest -g "make re && ./my_hunter"
  ```

## Uninstallation

To remove `epitest`, delete the script from `/usr/local/bin/`:

```bash
sudo rm /usr/local/bin/epitest
```

## Troubleshooting

If you encounter any issues:

- Ensure Docker is running properly.
- Verify that `epitest` is in `/usr/local/bin/` by running:
  ```bash
  which epitest
  ```
- Check for permission issues and rerun `setup.sh` with `sudo`.

For further assistance, consult the project repository or open an issue.

