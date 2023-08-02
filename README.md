# FFUF Fuzzing Script with Wordlist Selection
This script simplifies the utilization of FFUF (Fuzz Faster U Fool) for diverse fuzzing tasks, including directory and parameter fuzzing, as well as searching for specific file extensions. FFUF is a potent and versatile fuzzing tool that aids in identifying potential vulnerabilities or concealed files within web applications.

## Usage Instructions
<h4>Install FFUF:</h4> Prior to using this script, ensure FFUF is installed on your system. If not, refer to the official documentation for installation steps.

<h4>Run the Script:</h4> Open a terminal, navigate to the script's directory, and grant execution permission:

bash
Copy code
chmod +x script_name.sh
Replace script_name.sh with the actual script filename.

<h4>Execute the Script:</h4> Run the script in the terminal:

bash
Copy code
./script_name.sh
Replace script_name.sh with the actual script filename.

<h4>Menu Options:</h4>

Directory Fuzzing: Fuzz directories by providing a target URL and the path to a directory wordlist.
Parameter Fuzzing: Fuzz URL parameters by providing a target URL and the path to a parameter wordlist.
Search for Specific Extension: Find files with a particular extension on a target URL. Provide the extension and an extension wordlist.
Search for All Common Extensions: Search for common file extensions (e.g., txt, php, xml) on a target URL.
Search for Other Extension: Search for files with a user-specified extension on a target URL.
Exit: Terminate the script.

<h4>Input Details:</h4>
For fuzzing tasks, provide the target URL and the path to a wordlist containing fuzzing payloads.
For searching file extensions, input the target URL, the desired extension, and a wordlist with potential filenames.
Wordlists: Utilize custom or existing plain text wordlists with one item per line.

<h4>Note:</h4> This script augments FFUF with an interactive menu and the ability to select wordlists. Adapt the script to match your specific wordlist and use-case requirements.

Replace script_name.sh with your script's actual filename. These instructions guide users through running the script and performing fuzzing tasks using FFUF with different wordlists.
