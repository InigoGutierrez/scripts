#!/bin/sh
# Allows to select a host to send files to through scp

hostsfile="$HOME/.hosts"
hostnames="$(cut -d'#' -f1 < "$hostsfile" | fzf)"
host="$(grep "$hostnames" < "$hostsfile")"
hostname="$(echo "$host" | cut -d'#' -f1)"
hostaddress="$(echo "$host" | cut -d'#' -f2)"
hostport="$(echo  "$host" | cut -d'#' -f3)"
hostpass="$(echo "$host" | cut -d'#' -f4)"
targetPath="$(echo "$host" | cut -d'#' -f5)"
echo "Sending to $hostname"
[ "$hostpass" ] && pass -c "$hostpass"
[ "$hostport" ] && scp -P $hostport "$@" $hostaddress:$targetPath || scp "$@" $hostaddress:$targetPath # No quotes here!
