# Virtualize activated Win7 OEM

You have a computer with pre-installed, activated Win7 OEM and you want to legally move that Win to a VM? This repo will help.

## So it's a pirate howto?

No. You'll still need:
 
- your hardware your OEM is bound to
- your product key (the one from the sticker on that hardware)
- official installation media (like one of those officially published on Digital River)

Windows 7 OEM EULA says: 

> Instead of using the software directly on the licensed computer, 
> you may install and use the software within only one virtual (or otherwise emulated) hardware system on the licensed computer.

They just provide no means to actually do that transfer. 

## How?

1. Backup any data you need as you will do fresh install under a VM.
1. On the licensed hardware run non-virtualized linux. Next steps are performed on that linux.

   The 'non-virtualized' requirement is to make sure that linux has access to hardware's bios info. 
   You can use live version, dual-boot installation, or wipe the win completely.  
  
1. Create a new Virtual Box VM using any settings you need
1. Prepare the VM for later OEM activation:

  `curl https://raw.githubusercontent.com/piotrturski/virtualize-win7-oem/master/prepare-vm.sh | bash -s 'VM NAME'`
  
  this will copy bios UUID from the hardware to the VM and add to the VM newly generated hardware UUID (some say it's useful for backups).  
  
1. Uninstall windows (OEM license says you may have only one windows installed).

  * According to [this official instruction](http://windows.microsoft.com/en-us/windows7/Uninstall-Windows-7-on-a-multiboot-system),
one way is:

     > you need to format the partition containing Windows 7, or delete it entirely.
     
  * If you're afraid of accidentally deleting wrong partition, you can 
  [backup your partition table](http://unix.stackexchange.com/a/12988)     

1. Verify your installation media is original and not corrupted:
 * you can find hashes on the 
 [official msdn page](https://msdn.microsoft.com/en-us/subscriptions/downloads/#searchTerm=&ProductFamilyId=350&Architectures=x64&ProductFamilyIds=350&FileExtensions=.iso&PageSize=10&PageIndex=0&FileId=0)
 * or, if your file's sha1 is included in this repo, from the dir with your image do:
 
   ```curl https://raw.githubusercontent.com/piotrturski/virtualize-win7-oem/master/sums.sha1 | grep -wF "`ls`" | sha1sum -c```
1. Install windows inside the VM and activate it in a standard way using your product key
   
## Standard legal bullshit

IANAL so you are responsible for checking if using this instruction doesn't violate your license. 
