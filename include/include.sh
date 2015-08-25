includedalready=1
myname=${0##*/}
myname=${myname%.sh}
outlog=""
errlog=""
cmdlog=""

bootscripts=/src/blfs-bootscripts-20150304

setlogname()
{
	outlog=$logpath/$1-out.log
	errlog=$logpath/$1-err.log
	cmdlog=$logpath/$1-cmd.log
}

setlogname $myname

cmdlogrec()
{
	echo "`date`: $*" >> "$cmdlog"
}

profile()
{
	cmdlogrec "START $*"
	eval "$*"
	ret=$?
	cmdlogrec "END $*"
	return $ret
}

cmdtee()
{	
	eval "$*" > >(tee -a "$outlog") 2> >(tee -a "$errlog" >&2)
	ret=$?
	sleep 1 # needed to let tee buffers flush
	return $ret
}

die()
{
	>&2 echo "$*"
	echo -e "\a"
	exit 1
}

try()
{
	ptry cmdtee "$*" 
}

ptry()
{
	profile "$*" || die "LFS build failed at line: $*"
}

pressanykey()
{
	echo -e "\a"
	read -n1 -r -p "Press any key to continue if successful..." key
	echo " "
}
