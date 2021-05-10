#function prompt  
#{  
#    $ESC = [char]27
#    "$ESC[46mPS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) $ESC[0m"  
#} 

function open_terminal {

$winpath = $pwd

$nixPath = ((($winpath -replace "\\","/") -replace ":","") -replace " ","\ ").ToLower().Trim("/")

ssh -t joshi@192.168.131.148 "cd /mnt/hgfs/$nixpath && zsh"
}

Set-Alias shell open_terminal


function start_terminal {

    C:\'Program Files (x86)'\VMware\'VMware Workstation'\vmrun.exe -T ws $x "C:\Users\prabh\Documents\Virtual Machines\Kali Headless\Kali Headless.vmx" nogui


}

Set-Alias start-shell start_terminal