

function start-sh {
    
    C:\Users\prabh\Documents\linux\config.xlaunch

    C:\'Program Files (x86)'\VMware\'VMware Workstation'\vmrun.exe -T ws start "C:\Users\prabh\Documents\Virtual Machines\Kali Headless\Kali Headless.vmx" nogui

    $i = 40

    do {
        clear
        Write-Host "Shell starting in"$i" sec."
        Sleep 1
        $i--
    } while ($i -gt 0)
    clear
    Write-Host "Shell running..."
}

function reset-sh {
    
    C:\'Program Files (x86)'\VMware\'VMware Workstation'\vmrun.exe -T ws reset "C:\Users\prabh\Documents\Virtual Machines\Kali Headless\Kali Headless.vmx" nogui
    Write-Host "Shell reset.."
}


function sh {
    if (!(Test-Connection -Cn 10.10.10.3 -BufferSize 16 -Count 1 -quiet)){
        $output = "Shell Offline"
        Write-Host $output
        }
    else {
         $winpath = $pwd

         $nixPath = ((($winpath -replace "\\","/") -replace ":","") -replace " ","\ ").ToLower().Trim("/")

         ssh -t joshi@10.10.10.3 "cd /mnt/hgfs/$nixpath && zsh"
         }
}


function hashcat() {
    $orig = $pwd
    cd "C:\Tools\hashcat-6.2.2"
    ./hashcat.exe $args
    cd $orig
}

function st() {
    ssh -q joshi@10.10.10.3 'export DISPLAY=10.10.10.1:0.0 && 'nohup $args '> /dev/null 2>&1 &'
}