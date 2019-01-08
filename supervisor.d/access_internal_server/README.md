
A:
autossh -M 5678 -NR *:9022:127.0.0.1:22 root@106.14.203.234 -p 22
B:
autossh -CNL *:9999:localhost:9022 localhost
