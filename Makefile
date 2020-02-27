SOURCES := http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz

init:
	rpmdev-setuptree
	cd ~/rpmbuild/SOURCES/; wget $(SOURCES)
	cd ~/rpmbuild/SPECS/; rpmdev-newspec hello

build:
	cp hello.spec ~/rpmbuild/SPECS/
	cd ~/rpmbuild/SPECS/; rpmbuild -ba hello.spec

