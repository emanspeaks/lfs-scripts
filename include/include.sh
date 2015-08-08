includedalready=1
myname=${0##*/}
myname=${myname%.sh}
outlog=""
errlog=""
cmdlog=""

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
	"$*"
	ret=$?
	cmdlogrec "END $*"
	return $ret
}

cmdtee()
{	
	"$*" > >(tee -a "$outlog") 2> >(tee -a "$errlog" >&2)
	ret=$?
	sleep 1 # needed to let tee buffers flush
	return $ret
}

die()
{
	>&2 echo "$*"
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