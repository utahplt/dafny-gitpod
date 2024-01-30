# Dafny GitPod

## Setup

0. Sign up for a GitHub account
1. Go to <https://gitpod.io/#https://github.com/utahplt/dafny-gitpod>
    * Log in with GitHub
2. Wait for VSCode to appear
3. Go to <https://gitpod.io>, find the new workspace, click the `...` on the
   right, and pin this workspace.
    * If you don't pin it, GitPod may throw it away after N days!!

## Usage

1. Install Dafny from VSIX.
    * Right-click `ide-vscode-3.2.2.vsix` then `Install Extension VSIX`
2. Exit the workspace and reopen it from <https://gitpod.io>
    * _(There must be an easier way to reboot and get Dafny running, but I haven't found it!)
3. Open an example file. Verification should succeed. Edit the invariants to make it fail.
    * Examples: `Abs.dfy`, `LinearSearch.dfy`
    * You may need to accept a VSCode popup (bottom-right) about using Dafny 4.4

Dafny verifies on the fly as you edit code.

