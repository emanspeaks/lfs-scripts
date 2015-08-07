includedalready=1
myname=${0##*/}
myname=${myname%.sh}
outlog=$logpath/$myname-out.log
errlog=$logpath/$myname-err.log
cmdlog=$logpath/$myname-cmd.log

cmdprofile()
{
	echo "`date`: $*" >> "$cmdlog"
}

cmdtee()
{
	cmdprofile "START $*"
	$@ > >(tee -a "$outlog") 2> >(tee -a "$errlog" >&2)
	sleep 1 # needed to let tee buffers clear
	cmdprofile "END $*"
}

try()
{
	cmdtee $@ || (echo "LFS build failed at line: $*"; exit 1)
}
