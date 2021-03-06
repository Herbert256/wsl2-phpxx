rem
rem wsl support script
rem

wsl --import data "%wsl%\data" "%wsl%\base.tar"       > "%wsl%\log\data_import.txt"    2>&1

call windows\copy.cmd data data                       > "%wsl%\log\data_copy.txt"      2>&1

wsl -d data -u root -- /wsl/base/adduser.sh data      > "%wsl%\log\data_user.txt"      2>&1
wsl -d data -u root -- /wsl/data/sublime.sh           > "%wsl%\log\data_sublime.txt"   2>&1
wsl -d data -u root -- /wsl/data/memcached.sh         > "%wsl%\log\data_memcached.txt" 2>&1
wsl -d data -u root -- /wsl/data/mariadb.sh           > "%wsl%\log\data_db.txt"        2>&1

rem make below active if you have a 4K screen
rem wsl -d data -u root -- /wsl/data/HiDPI.sh data    > "%wsl%\log\data_HiDPI.txt"     2>&1

call windows\mount.cmd data                           > "%wsl%\log\data_mount.txt"     2>&1
