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
	ret=$?
	cmdlogrec "END $*"
	return $ret
}

cmdtee()
{	
	$@ > >(tee -a "$outlog") 2> >(tee -a "$errlog" >&2)
	ret=$?
	sleep 1 # needed to let tee buffers flush
	return $ret
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
