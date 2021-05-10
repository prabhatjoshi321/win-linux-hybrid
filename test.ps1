
$winpath = $pwd

# replace backslashes with slashes, colons with nothing,
# convert to lower case and trim last /
$nixPath = (($winpath -replace "\\","/") -replace ":","").ToLower().Trim("/")

ssh -t joshi@192.168.131.158 "cd /mnt/hgfs/$nixpath && bash"
