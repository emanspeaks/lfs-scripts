includedalready=1
myname=${0##*/}
myname=${myname%.sh}
outlog=$logpath/$myname-out.log
errlog=$logpath/$myname-err.log
cmdlog=$logpath/$myname-cmd.log

cmdlogrec()
{
	echo "`date`: $*" >> "$cmdlog"
}

profile()
{
	cmdlogrec "START $*"
	$@
	cmdlogrec "END $*"
}

cmdtee()
{	
	$@ > >(tee -a "$outlog") 2> >(tee -a "$errlog" >&2)
	sleep 1 # needed to let tee buffers flush
}

die()
{
	>&2 echo $*
	exit 1
}

try()
{
	profile cmdtee $@ || die "LFS build failed at line: $*"
}
