#!/bin/sh
# Allows to select a host to send files to through scp

hostsfile="$HOME/.hosts"
hostnames="$(sed '/^#.*$/d' < "$hostsfile" | cut -d'#' -f1 | fzf)" || exit 0
host="$(grep "$hostnames" < "$hostsfile")"
hostname="$(echo "$host" | cut -d'#' -f1)"
hostaddress="$(echo "$host" | cut -d'#' -f2)"
hostport="$(echo  "$host" | cut -d'#' -f3)"
hostpass="$(echo "$host" | cut -d'#' -f4)"
targetPath="$(echo "$host" | cut -d'#' -f5)"
echo "Sending to $hostname"
[ "$hostpass" ] && pass -c "$hostpass"
[ "$hostport" ] && scp -r -P $hostport "$@" $hostaddress:$targetPath || scp -r "$@" $hostaddress:$targetPath # No quotes here!
