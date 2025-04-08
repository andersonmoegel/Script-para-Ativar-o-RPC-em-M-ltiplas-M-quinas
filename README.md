# Script to Enable RPC Service on Multiple Machines

This script uses **PsExec** to enable the RPC (Remote Procedure Call) service on several remote machines listed in a text file.

## 📌 Prerequisites

- **PsExec**: Make sure PsExec is available in your `PATH` or in the same directory as the script.
- **Administrative Permissions**: You need administrative rights on the remote machines.

## 📄 Text File with Computer List

Create a text file named `computers.txt` containing the machine names or IP addresses, one per line. Example:

```
COMPUTER1
COMPUTER2
192.168.1.10
```

## ⚙️ Batch Script

Create a batch script file named `enable_rpc.bat` with the following content:

```cmd
@echo off
for /f %%i in (computers.txt) do (
    echo Enabling RPC on %%i
    psexec \\%%i -s -d sc config RpcSs start= auto
    psexec \\%%i -s -d net start RpcSs
)
```

## 🚀 Running the Script

### 1️⃣ Open Command Prompt as Administrator

Right-click the Command Prompt icon and select **"Run as administrator"**.

### 2️⃣ Navigate to the Script Directory

Use the `cd` command to go to the directory where PsExec and the script are located. Example:

```cmd
cd C:\path\to\directory
```

### 3️⃣ Run the Script

Execute the batch script using PsExec:

```cmd
psexec @computers.txt -s -d C:\path\to\directory\enable_rpc.bat
```

## 📝 Command Explanation

- **`psexec`**: Starts PsExec.
- **`-s`**: Runs the process under the System account.
- **`-d`**: Doesn’t wait for the process to finish (non-interactive).
- **`@computers.txt`**: Specifies a text file with a list of computers to run the command on.
- **`sc config RpcSs start= auto`**: Sets the RPC service to start automatically.
- **`net start RpcSs`**: Starts the RPC service.

## 🔍 Final Considerations

Ensure PsExec is configured properly and that you have the required permissions to execute remote commands on the listed machines. If issues arise, check your network and firewall settings.

---

📌 **Tip**: If you're having trouble, use the command `psexec \\COMPUTERNAME cmd` to test the remote connection before running the full script.
