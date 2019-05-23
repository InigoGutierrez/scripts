#!/bin/sh
# Allows to select a host to connect to through ssh
# Hosts are read from the file $hostsfile, in which each line should be a host in the form identifier#address#port#input for pass
# Port and input for pass are optional

hostsfile="$HOME/.hosts"
hostnames="$(sed '/^#.*$/d' < "$hostsfile" | cut -d'#' -f1 | fzf)"
host="$(grep "$hostnames" < "$hostsfile")"
hostname="$(echo "$host" | cut -d'#' -f1)"
hostaddress="$(echo "$host" | cut -d'#' -f2)"
hostport="$(echo  "$host" | cut -d'#' -f3)"
hostpass="$(echo "$host" | cut -d'#' -f4)"
echo "Connecting to $hostname"
[ "$hostpass" ] && pass -c "$hostpass"
[ "$hostport" ] && ssh $hostaddress -p $hostport || ssh $hostaddress # No quotes here!
#$(echo "ssh $hostaddress -p $hostport") # Alternative to prev line
