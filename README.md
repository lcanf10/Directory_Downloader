# Directory_Downloader

PowerShell Script to Download Files from a Web Directory

This PowerShell script is designed to download files and directories from a specified web directory to a local output directory. It checks if the output directory exists, enables TLS 1.2 and TLS 1.1 protocols for secure communication, and recursively downloads all content from the web directory. This script is particularly useful for batch downloading or mirroring web directories where manual download would be inefficient.
Features

    Checks if the local output directory exists and provides feedback if it does not.
    Enables TLS 1.2 and TLS 1.1 protocols to ensure secure file transfers.
    Downloads files and explores directories recursively from the specified URL.
    Dynamically creates local directories to mirror the structure of the web directory.
    Provides console output to track the download process of files and directories.

Prerequisites

Before running this script, ensure that you have PowerShell installed on your system. This script is compatible with Windows PowerShell 5.1 and newer versions, including PowerShell Core on Linux and macOS systems.
Usage

    Set the Output Directory and URL: Modify the $outputdir and $url variables at the beginning of the script to your desired local output directory and the web directory URL you wish to download from.

    Run the Script: Execute the script in PowerShell. Ensure you have the necessary permissions to write to the specified output directory and access the web directory.

    Review Console Output: The script will output messages during the execution, indicating the creation of directories, download of files, or any errors encountered.

Example

powershell

$outputdir = 'C:\output'
$url = 'https://example.com/directory'

# Script execution commands follow...

Replace 'C:\output' with the path to your desired output directory and 'https://example.com/directory' with the URL of the web directory you want to download.
Limitations

    The script currently only supports non-authenticated downloads. If the web directory requires authentication, modifications to the script are necessary.
    Large files may take a significant amount of time to download, depending on your internet connection.
