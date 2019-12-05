Notes
=====

This fork of Apache Tika(TM) was created to provide more details for Excel file metadata, and to provide a place for Bluescape to add additional metadata
handling as needed. It was forked when the latest release upstream was 1.22, so we created a develop branch from that tag. Master branch still tracks
upstream, so we can merge or update as needed.

Caveats
-------

Since the release of 1.22, vulnerabilities have been discovered in several of the library dependencies, including jackson, quartz and poi. As a result,
the security audit fails the build on this current branch. For now, the failure has been downgraded to a warning with the mvn option -Dossindex.fail=false
This should be revisited soon and probably we should update to upstream master, where the dependencies have already been upgraded.
