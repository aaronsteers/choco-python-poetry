# Chocolatey Installer for Python Poetry

## Package Maintainer Guide

### Incrementing the package version number

To increment the version number, simply update the version string in `poetry.nuspec`.
For prerelease versions, use a `-beta` suffix, e.g. `0.1.0-beta`.

- Note: the package version number is not expected to match the Poetry version. This is
  because the package does not need to change in order to capture the latest version of the
  Poetry library.

### Updating the installer script

This step is only needed when the `get-poetry.py` script is updated. The `get-poetry.py`
script itself will regardless always attempt to download the latest version.

```cmd
cd ./tools
curl https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py ./get-poetry.py
```

### Building and testing the package locally

#### Build local Chocolatey package

```cmd
cd choco-python-poetry
cpack
```

If successful, you should see:

```cmd
> c:\Files\Source\Choco-Python-Poetry>cpack
Chocolatey v0.10.15
Attempting to build package from 'poetry.nuspec'.
Successfully created package 'c:\Files\Source\Choco-Python-Poetry\poetry.0.0.2-beta.nupkg'
```

#### Test local install

```cmd
cinst poetry -source %cd% --pre -y
```

Or to rebuild and re-test the install in a single command:

```cmd
cpack && cinst poetry -source %cd% --pre -y
```

Test by running `refreshenv` and then `poetry`.

#### Test local uninstall

```cmd
choco uninstall poetry -y
```

Test by running `poetry` - command should fail if uninstall was successful.

## See Also - Additional Docs:

- https://chocolatey.org/docs/create-packages
- https://github.com/chocolatey/chocolatey-test-environment
- https://chocolatey.org/docs/helpers-start-chocolatey-process-as-admin
- https://chocolatey.org/docs/helpers-install-chocolatey-environment-variable
  - Ex: `Install-ChocolateyEnvironmentVariable -variableName "SOMEVAR" -variableValue "value" [-variableType = 'Machine' #Defaults to 'User']`
